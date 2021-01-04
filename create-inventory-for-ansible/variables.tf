##########
# provider
##########

variable "token" {
  type        = string
  description = "Yandex Cloud security OAuth token"
}


variable "cloud_id" {
  type        = string
  description = "your cloud id"
}

variable "folder_id" {
  type        = string
  description = "your folder id"
}

variable "create_terraform1" {
  type = string
  default = "true"
}

variable "create_terraform2" {
  type = string
  default = "true"
}
