# Example for generated invetory file for Ansible from terraform output in Yandex Cloud

 - Add terraform.tfvars with credentials Yandex Cloud
 - change token, cloud_id, folder_id in terraform.tfvars
 - `terraform init`
 - `terraform plan`
 - `terraform apply`
 - `ansible all -m ping -i inventory.yaml -u <username>`
 - `ansible all -m ping -i inventory.ini -u <username>`
