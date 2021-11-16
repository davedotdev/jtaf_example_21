resource "junos-device_Policy__OptionsPolicy__StatementTermFromInterface" "policy_redist_lo0_from" {
   resource_name = "export_ifaces_1"
   name = "policy_redist_lo0"
   name__1 = "policy_redist_lo0"
   interface = "lo0.0"
}

resource "junos-device_Policy__OptionsPolicy__StatementTermThenAccept" "policy_redist_lo0_then" {
   resource_name = "export_ifaces_2"
   name = "policy_redist_lo0"
   name__1 = "policy_redist_lo0"
   depends_on = [junos-device_Policy__OptionsPolicy__StatementTermFromInterface.policy_redist_lo0_from]
}

resource "junos-device_ProtocolsBgpGroupPeer__As" "bgp_neighbor_vqfx02_peer_as" {
    resource_name = "bgp_neighbor_vqfx_02_1"
    name = "vqfx02_group"
    peer__as = "65002"
}

resource "junos-device_ProtocolsBgpGroupFamilyInet6Unicast" "bgp_neighbor_vqfx02_inet6_unicast" {
  resource_name = "bgp_neighbor_vqfx_02_2"
  name = "vqfx02_group"
  depends_on = [junos-device_ProtocolsBgpGroupNeighborExport.bgp_neighbor_vqfx02_export]
}

resource "junos-device_ProtocolsBgpGroupNeighborExport" "bgp_neighbor_vqfx02_export" {
    resource_name = "bgp_neighbor_vqfx_02"
    name = "vqfx02_group"
    name__1 = "dead:babe:beef::2"
    export = "policy_redist_lo0"
}




