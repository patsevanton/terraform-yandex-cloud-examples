resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      vm_1_name                = yandex_compute_instance.vm-1.name,
      vm_1_hostname            = yandex_compute_instance.vm-1.hostname,
      vm_1_external_ip_address = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address,
      vm_1_internal_ip_address = yandex_compute_instance.vm-1.network_interface.0.ip_address,
      
      vm_2_name                = yandex_compute_instance.vm-2.name,
      vm_2_hostname            = yandex_compute_instance.vm-2.hostname,
      vm_2_external_ip_address = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address,
      vm_2_internal_ip_address = yandex_compute_instance.vm-2.network_interface.0.ip_address,
    }
  )
  filename = "inventory.ini"
}

