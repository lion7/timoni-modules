package templates

import (
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
)

#DaemonSet: appsv1.#DaemonSet & {
	#config:    #Config
	apiVersion: "apps/v1"
	kind:       "DaemonSet"
	metadata:   #config.metadata
	spec: appsv1.#DaemonSetSpec & {
		selector: matchLabels: #config.selector.labels
		template: {
			metadata: {
				labels: #config.selector.labels
				if #config.podAnnotations != _|_ {
					annotations: #config.podAnnotations
				}
			}
			spec: corev1.#PodSpec & {
				serviceAccountName: #config.metadata.name
				hostNetwork:        true
				containers: [
					{
						name:  "pause"
						image: "registry.k8s.io/pause:3.10"
					},
				]
				initContainers: [
					{
						name:            "install-cni"
						image:           #config.image.reference
						imagePullPolicy: #config.image.pullPolicy
						resources:       #config.resources
						args: [
							"/etc/cni/net.d/bridge-cni.conflist",
						]
						env: [
							{
								name: "NODE_NAME"
								valueFrom: fieldRef: fieldPath: "spec.nodeName"
							},
						]
						volumeMounts: [
							{
								name:      "cni-conf"
								mountPath: "/etc/cni/net.d"
							},
						]
						securityContext: {
							runAsUser: 0
						}
					},
				]
				volumes: [
					{
						name: "cni-conf"
						hostPath: path: "/etc/cni/net.d"
					},
				]
				priorityClassName: "system-node-critical"
				if #config.topologySpreadConstraints != _|_ {
					topologySpreadConstraints: #config.topologySpreadConstraints
				}
				if #config.affinity != _|_ {
					affinity: #config.affinity
				}
				if #config.tolerations != _|_ {
					tolerations: #config.tolerations
				}
				if #config.imagePullSecrets != _|_ {
					imagePullSecrets: #config.imagePullSecrets
				}
			}
		}
	}
}
