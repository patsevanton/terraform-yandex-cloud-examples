# output "zookeeper_external_ip_address" {
#   value = yandex_compute_instance.zookeeper.*.network_interface.0.nat_ip_address
# }

# output "zookeeper_internal_ip_address" {
#   value = yandex_compute_instance.zookeeper.*.network_interface.0.ip_address
# }

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {

      zookeeper_name                = yandex_compute_instance.zookeeper.*.name,
      zookeeper_external_ip_address = yandex_compute_instance.zookeeper.*.network_interface.0.nat_ip_address,
      zookeeper_internal_ip_address = yandex_compute_instance.zookeeper.*.network_interface.0.ip_address,

    }
  )
  filename = "inventory.ini"
}
