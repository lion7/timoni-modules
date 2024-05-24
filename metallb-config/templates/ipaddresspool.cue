package templates

import (
	metallbv1 "metallb.io/ipaddresspool/v1beta1"
)

#IPAddressPool: metallbv1.#IPAddressPool & {
	#config:  #Config
	metadata: #config.metadata
	spec:     metallbv1.#IPAddressPoolSpec & #config.pool
}
