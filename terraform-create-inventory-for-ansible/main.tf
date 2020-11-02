provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "application1" {
  name = "application1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd84ls54ki3ebimih00p"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "zookeeper" {
  name = "zookeeper-${count.index}"
  count = 3

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd84ls54ki3ebimih00p"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "application1_external_ip_address" {
  value = yandex_compute_instance.application1.*.network_interface.0.nat_ip_address
}

output "application1_internal_ip_address" {
  value = yandex_compute_instance.application1.*.network_interface.0.ip_address
}

output "zookeeper_external_ip_address" {
  value = yandex_compute_instance.zookeeper.*.network_interface.0.nat_ip_address
}

output "zookeeper_internal_ip_address" {
  value = yandex_compute_instance.zookeeper.*.network_interface.0.ip_address
}


