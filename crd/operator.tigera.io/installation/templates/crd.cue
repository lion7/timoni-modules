package templates

import crd "operator.tigera.io/installation/v1"

#Installation: crd.#Installation & {
	#config:  #Config
	metadata: #config.metadata
	spec:     crd.#InstallationSpec & #config.spec
}
