package templates

import crd "metallb.io/ipaddresspool/v1beta1"

#IPAddressPool: crd.#IPAddressPool & {
	#config: #Config
	metadata: #config.metadata
	spec: crd.#IPAddressPoolSpec & #config.spec
}
