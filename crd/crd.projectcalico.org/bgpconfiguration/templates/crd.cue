package templates

import crd "crd.projectcalico.org/bgpconfiguration/v1"

#BGPConfiguration: crd.#BGPConfiguration & {
	#config:  #Config
	metadata: #config.metadata
	spec:     crd.#BGPConfigurationSpec & #config.spec
}
