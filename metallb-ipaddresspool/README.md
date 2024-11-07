# metallb-ipaddresspool

A [timoni.sh](http://timoni.sh) module for managing a MetalLB IP pool.

## Install

To create an instance using the default values:

```shell
timoni -n metallb-system apply metallb-ipaddresspool oci://ghcr.io/lion7/timoni-modules/metallb-ipaddresspool
```

To change the [default configuration](#configuration),
create one or more `values.cue` files and apply them to the instance.

For example, create a file `my-values.cue` with the following content:

```cue
values: {
  spec: adresses: [
    "203.0.113.0/24",
    "2001:db8::/32"
  ]
}

```

And apply the values with:

```shell
timoni -n metallb-system apply metallb-ipaddresspool oci://ghcr.io/lion7/timoni-modules/metallb-ipaddresspool \
--values ./my-values.cue
```

## Uninstall

To uninstall an instance and delete all its Kubernetes resources:

```shell
timoni -n metallb-system delete metallb-ipaddresspool
```

## Configuration

### General values

| Key                      | Type                           | Default | Description                                                               |
|--------------------------|--------------------------------|---------|---------------------------------------------------------------------------|
| `metadata: labels:`      | `{[ string]: string}`          | `{}`    | Common labels for all resources                                           |
| `metadata: annotations:` | `{[ string]: string}`          | `{}`    | Common annotations for all resources                                      |
| `spec:`                  | `metallbv1.#IPAddressPoolSpec` | `{}`    | [IPAddressPool spec](https://metallb.universe.tf/apis/#ipaddresspoolspec) |
