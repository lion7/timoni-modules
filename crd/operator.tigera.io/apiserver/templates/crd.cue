package templates

import crd "operator.tigera.io/apiserver/v1"

#APIServer: crd.#APIServer & {
	#config:  #Config
	metadata: #config.metadata
	spec:     crd.#APIServerSpec & #config.spec
}
