output "application1_external_ip_address" {
  value = yandex_compute_instance.application1.*.network_interface.0.nat_ip_address
}

output "application1_internal_ip_address" {
  value = yandex_compute_instance.application1.*.network_interface.0.ip_address
}