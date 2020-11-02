resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      internal_ip_address_vm_1 = yandex_compute_instance.vm-1.network_interface.0.ip_address,
      internal_ip_address_vm_2 = yandex_compute_instance.vm-2.network_interface.0.ip_address
    }
  )
  filename = "inventory"
}

