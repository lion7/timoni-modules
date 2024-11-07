@if(debug)

package main

// Values used by debug_tool.cue.
// Debug example 'cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build'.
values: {
	spec: {
		calicoNetwork: {
			ipPools: [
				{
					cidr:          "2a02:22a0:eee4:d120:8281::d:0/112"
					encapsulation: "None"
				},
			]
			nodeAddressAutodetectionV6: kubernetes: "NodeInternalIP"
		}
	}
}
