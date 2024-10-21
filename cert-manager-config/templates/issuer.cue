package templates

import (
	issuerv1 "cert-manager.io/issuer/v1"
)

#Issuer: issuerv1.#Issuer & {
	#config:  #Config
	#spec:   	issuerv1.#IssuerSpec
	metadata: #config.metadata
	spec:     issuerv1.#IssuerSpec & #spec
}
