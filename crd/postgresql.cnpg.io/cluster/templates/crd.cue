package templates

import crd "postgresql.cnpg.io/cluster/v1"

#Cluster: crd.#Cluster & {
	#config:  #Config
	metadata: #config.metadata
	spec:     crd.#ClusterSpec & #config.spec
}
