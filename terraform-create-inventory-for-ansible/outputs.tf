resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      application1_name                   = yandex_compute_instance.application1.name,
      application1_external_ip_address    = yandex_compute_instance.application1.network_interface.0.nat_ip_address,
      application1_internal_ip_address    = yandex_compute_instance.application1.network_interface.0.ip_address,
      
      # zookeeper_name                = yandex_compute_instance.zookeeper.*.name,
      # zookeeper_external_ip_address = yandex_compute_instance.zookeeper.*.network_interface.0.nat_ip_address,
      # zookeeper_internal_ip_address = yandex_compute_instance.zookeeper.*.network_interface.0.ip_address,
      
      etcd_name                = yandex_compute_instance.etcd.*.name,
      etcd_external_ip_address = yandex_compute_instance.etcd.*.network_interface.0.nat_ip_address,
      etcd_internal_ip_address = yandex_compute_instance.etcd.*.network_interface.0.ip_address,

    }
  )
  filename = "inventory.ini"
}
