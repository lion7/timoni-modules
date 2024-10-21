package templates

import (
	clusterissuerv1 "cert-manager.io/clusterissuer/v1"
)

#ClusterIssuer: clusterissuerv1.#ClusterIssuer & {
	#config:  #Config
	#spec:   	clusterissuerv1.#ClusterIssuerSpec
	metadata: #config.metadata
	spec:     clusterissuerv1.#ClusterIssuerSpec & #spec
}
