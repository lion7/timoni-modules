# cert-manager-clusterissuer

A [timoni.sh](http://timoni.sh) module for managing MetalLB custom resources.

## Install

To create an instance using the default values:

```shell
timoni -n cert-manager apply cert-manager-clusterissuer oci://ghcr.io/lion7/timoni-modules/cert-manager-clusterissuer
```

To change the [default configuration](#configuration),
create one or more `values.cue` files and apply them to the instance.

For example, create a file `my-values.cue` with the following content:

```cue
values: {
	pool: adresses: [
		"203.0.113.0/24",
		"2001:db8::/32"
	]
}
```

And apply the values with:

```shell
timoni -n cert-manager apply cert-manager-clusterissuer oci://ghcr.io/lion7/timoni-modules/cert-manager-clusterissuer \
--values ./my-values.cue
```

## Uninstall

To uninstall an instance and delete all its Kubernetes resources:

```shell
timoni -n cert-manager delete cert-manager-clusterissuer
```

## Configuration

### General values

| Key                      | Type                   | Default | Description                                                                                                      |
|--------------------------|------------------------|---------|------------------------------------------------------------------------------------------------------------------|
| `metadata: labels:`      | `{[ string]: string}`  | `{}`    | Common labels for all resources                                                                                  |
| `metadata: annotations:` | `{[ string]: string}`  | `{}`    | Common annotations for all resources                                                                             |
| `issuers:`               | `[#IssuerSpec]`        | `{}`    | [Issuer spec](https://doc.crds.dev/github.com/cert-manager/cert-manager/cert-manager.io/Issuer/v1)               |
| `clusterissuers:`        | `[#ClusterIssuerSpec]` | `{}`    | [ClusterIssuer spec](https://doc.crds.dev/github.com/cert-manager/cert-manager/cert-manager.io/ClusterIssuer/v1) |
