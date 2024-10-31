package templates

import (
	rbacv1 "k8s.io/api/rbac/v1"
)

#ClusterRole: rbacv1.#ClusterRole & {
	#config:    #Config
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"
	metadata:   #config.metadata
	rules: [
		{
			apiGroups: [""]
			resources: ["nodes"]
			verbs: ["get", "list", "watch"]
		}
	]
}
