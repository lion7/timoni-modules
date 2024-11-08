package templates

#blueprint: crd.#blueprint & {
	#config: #Config
	metadata: #config.metadata
	spec: crd.#blueprintSpec & #config.spec
}
