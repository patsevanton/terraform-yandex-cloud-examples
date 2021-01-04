output "etcd_external_ip_address" {
  value = yandex_compute_instance.etcd.*.network_interface.0.nat_ip_address
}

output "etcd_internal_ip_address" {
  value = yandex_compute_instance.etcd.*.network_interface.0.ip_address
}

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      
      etcd_name                = yandex_compute_instance.etcd.*.name,
      etcd_external_ip_address = yandex_compute_instance.etcd.*.network_interface.0.nat_ip_address,
      etcd_internal_ip_address = yandex_compute_instance.etcd.*.network_interface.0.ip_address,

    }
  )
  filename = "inventory.ini"
}
