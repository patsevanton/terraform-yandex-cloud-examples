output "etcd_external_ip_address" {
  value = yandex_compute_instance.etcd.*.network_interface.0.nat_ip_address
}

output "etcd_internal_ip_address" {
  value = yandex_compute_instance.etcd.*.network_interface.0.ip_address
}
