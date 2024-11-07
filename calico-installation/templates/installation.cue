package templates

import (
	tigerav1 "operator.tigera.io/installation/v1"
)

#Installation: tigerav1.#Installation & {
	#config:  #Config
	metadata: #config.metadata
	spec:     tigerav1.#InstallationSpec & #config.spec
}
