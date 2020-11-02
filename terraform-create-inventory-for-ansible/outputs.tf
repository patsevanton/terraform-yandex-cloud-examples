resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      application1_name                   = yandex_compute_instance.application1.name,
      application1_hostname               = yandex_compute_instance.application1.hostname,
      application1_external_ip_address    = yandex_compute_instance.application1.network_interface.0.nat_ip_address,
      application1_internal_ip_address    = yandex_compute_instance.application1.network_interface.0.ip_address,
      
      patroni_name                = yandex_compute_instance.patroni.*.name,
      patroni_hostname            = yandex_compute_instance.patroni.*.hostname,
      patroni_external_ip_address = yandex_compute_instance.patroni.*.network_interface.0.nat_ip_address,
      patroni_internal_ip_address = yandex_compute_instance.patroni.*.network_interface.0.ip_address,
    }
  )
  filename = "inventory.ini"
}

