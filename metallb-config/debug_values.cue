@if(debug)

package main

// Values used by debug_tool.cue.
// Debug example 'cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build'.
values: {
	pool: {
		addresses: ["192.168.2.0/24", "2001:db8:abcd::/64"]
		avoidBuggyIPs: true
	}
}
