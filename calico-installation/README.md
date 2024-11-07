# calico-installation

A [timoni.sh](http://timoni.sh) module for managing a Tigera Calico installation.

## Install

To create an instance using the default values:

```shell
timoni -n tigera-operator apply calico-installation oci://ghcr.io/lion7/timoni-modules/calico-installation
```

To change the [default configuration](#configuration),
create one or more `values.cue` files and apply them to the instance.

For example, create a file `my-values.cue` with the following content:

```cue
values: {
  spec: {
    // Configures Calico networking.
    calicoNetwork: {
      ipPools: [
        {
          name:          "default-ipv4-ippool"
          blockSize:     26
          cidr:          "192.168.0.0/16"
          encapsulation: "VXLANCrossSubnet"
          natOutgoing:   "Enabled"
          nodeSelector:  "all()"
        },
      ]
    }
  }
}
```

And apply the values with:

```shell
timoni -n tigera-operator apply calico-installation oci://ghcr.io/lion7/timoni-modules/calico-installation \
--values ./my-values.cue
```

## Uninstall

To uninstall an instance and delete all its Kubernetes resources:

```shell
timoni -n tigera-operator delete calico-installation
```

## Configuration

### General values

| Key                      | Type                         | Default | Description                                                                          |
|--------------------------|------------------------------|---------|--------------------------------------------------------------------------------------|
| `metadata: labels:`      | `{[ string]: string}`        | `{}`    | Common labels for all resources                                                      |
| `metadata: annotations:` | `{[ string]: string}`        | `{}`    | Common annotations for all resources                                                 |
| `spec:`                  | `tigerav1.#InstallationSpec` | `{}`    | [Installation spec](https://docs.tigera.io/calico/latest/reference/installation/api) |
