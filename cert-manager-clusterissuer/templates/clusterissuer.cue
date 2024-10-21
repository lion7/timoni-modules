package templates

import (
	clusterissuerv1 "cert-manager.io/clusterissuer/v1"
)

#ClusterIssuer: clusterissuerv1.#ClusterIssuer & {
	#config:  #Config
	metadata: #config.metadata
	spec:     clusterissuerv1.#ClusterIssuerSpec & #config.spec
}
