provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
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

# module "application1" {
#   source = "./modules/application1"
# }

module "etcd-cluster" {
  source = "./modules/etcd-cluster"
  subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
}

# module "zookeeper-cluster" {
#   source = "./modules/etcd-cluster"
# }
