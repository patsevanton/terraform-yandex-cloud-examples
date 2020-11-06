resource "yandex_compute_instance" "etcd" {
  name = "etcd-${count.index}"
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
    # subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}