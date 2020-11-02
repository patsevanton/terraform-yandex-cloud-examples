resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      name                     = yandex_compute_instance.vm-2.name,
      hostname_vm_1            = yandex_compute_instance.vm-2.hostname,
      external_ip_address_vm_1 = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address,
    }
  )
  filename = "inventory.ini"
}

