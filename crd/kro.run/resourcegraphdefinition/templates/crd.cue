package templates

import crd "kro.run/resourcegraphdefinition/v1alpha1"

#ResourceGraphDefinition: crd.#ResourceGraphDefinition & {
	#config:  #Config
	metadata: #config.metadata
	spec:     crd.#ResourceGraphDefinitionSpec & #config.spec
}
