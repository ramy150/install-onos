#!/usr/bin/env bash


function create_ns() {
echo "Creating the namespace $1"
ip netns add $1
}

function create_ovs_bridge() {
echo "Creating the OVS bridge $1"
ovs-vsctl add-br $1

}


function attach_ns_to_ovs() {
echo "Attaching the namespace $1 to the OVS $2"
ip link add $3 type veth peer name $4
ip link set $3 netns $1
ovs-vsctl add-port $2 $4 -- set Interface $4
ip netns exec $1 ip addr add $5/24 dev $3
ip netns exec $1 ip link set dev $3 up
ip link set $4 up
}


function attach_ovs_to_sdn() {
echo "Attaching the OVS bridge to the ONOS controller"
ovs-vsctl set-controller $1 tcp:$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -q  --filter ancestor=onosproject/onos)):6653
}


create_ns red
create_ns blue

create_ovs_bridge br-onos
attach_ns_to_ovs red br-onos veth-red veth-red-br 10.0.0.2
attach_ns_to_ovs blue br-onos veth-blue veth-blue-br 10.0.0.3

attach_ovs_to_sdn br-onos