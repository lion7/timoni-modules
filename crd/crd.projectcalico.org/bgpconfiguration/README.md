# BGPConfiguration

A [timoni.sh](http://timoni.sh) module for deploying crd.projectcalico.org/BGPConfiguration to Kubernetes clusters.

## Install

To create an instance using the default values:

```shell
timoni -n default apply bgpconfiguration oci://<container-registry-url>
```

To change the [default configuration](#configuration),
create one or more `values.cue` files and apply them to the instance.

For example, create a file `my-values.cue` with the following content:

```cue
values: {
    spec: {
    	...
    }
}
```

And apply the values with:

```shell
timoni -n default apply bgpconfiguration oci://<container-registry-url> \
--values ./my-values.cue
```

## Uninstall

To uninstall an instance and delete all its Kubernetes resources:

```shell
timoni -n default delete bgpconfiguration
```

## Configuration

| Key                      | Type                  | Default | Description                          |
|--------------------------|-----------------------|---------|--------------------------------------|
| `metadata: labels:`      | `{[ string]: string}` | `{}`    | Common labels for all resources      |
| `metadata: annotations:` | `{[ string]: string}` | `{}`    | Common annotations for all resources |
| `spec:`                  | `BGPConfigurationSpec`       | `{}`    | Spec of the CRD BGPConfiguration            |
