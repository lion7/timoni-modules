package templates

import crd "cert-manager.io/clusterissuer/v1"

#ClusterIssuer: crd.#ClusterIssuer & {
	#config: #Config
	metadata: #config.metadata
	spec: crd.#ClusterIssuerSpec & #config.spec
}
