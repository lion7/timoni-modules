#!/bin/bash

# Stop on errors and cd to script dir
set -eu
cd "$(dirname "$0")"

if [ $# != 1 ]; then
  echo "Usage: generate-module.sh CRD_URL"
  exit 1
fi

CRD_URL="$1"

if [[ "$CRD_URL" =~ ^https?:.* ]]; then
  CRD_PATH=$(mktemp --suffix .yaml)
  wget -O "$CRD_PATH" "$CRD_URL"
elif [[ "$CRD_URL" =~ ^file?://.* ]]; then
  CRD_PATH="${CRD_URL//file:\/\//}"
elif [[ "$CRD_URL" =~ ^file?:.* ]]; then
  CRD_PATH="${CRD_URL//file:/}"
elif [ -f "$CRD_URL" ]; then
  CRD_PATH="$CRD_URL"
fi

# Extract CRD info
CRD_GROUP=$(yq .spec.group "$CRD_PATH")
CRD_KIND=$(yq .spec.names.kind "$CRD_PATH")
CRD_SINGULAR=$(yq .spec.names.singular "$CRD_PATH")
CRD_VERSION=$(yq '.spec.versions[] | select(.served == true) | .name' "$CRD_PATH")

# (Re)generate the module
rm -rf "crd/$CRD_GROUP/$CRD_SINGULAR"
mkdir -p "crd/$CRD_GROUP"
cd "crd/$CRD_GROUP"
timoni mod init "$CRD_KIND" --blueprint oci://ghcr.io/lion7/timoni-modules/blueprints/crd
mv "$CRD_KIND" "$CRD_SINGULAR"
cd "$CRD_SINGULAR"

# Post-processing
timoni mod vendor crd -f "$CRD_URL"
sed -i "s|module for deploying $CRD_KIND|module for deploying $CRD_GROUP/$CRD_KIND|" README.md
sed -ri "s|(apply\|delete) $CRD_KIND|\1 $CRD_SINGULAR|" README.md
sed -i "s|module: \"timoni.sh/$CRD_KIND\"|// Generated from $CRD_URL\nmodule: \"timoni.sh/$CRD_SINGULAR\"|" cue.mod/module.cue
sed -i "s|timoni.sh/$CRD_KIND/templates|timoni.sh/$CRD_SINGULAR/templates|" timoni.cue
sed -i "s|package templates|package templates\n\nimport crd \"$CRD_GROUP/$CRD_SINGULAR/$CRD_VERSION\"|" templates/*
timoni mod vet .
find . -iname '*.cue' -exec cue fmt {} +