variable "source-cloud" { type = string }
variable "source-endpoint_type" { type = string }
variable "source-flavor" { type = string }
variable "source-image_name" { type = string }
variable "source-source_image" { type = string }
variable "source-instance_name" { type = string }
variable "source-ssh_username" { type = string }
variable "source-ssh_private_key_file" { type = string }
variable "source-ssh_keypair_name" { type = string }
variable "source-networks" { 
  type = list(string)
}
variable "source-floating_ip" { type = string }
variable "source-user_data" { type = string }
variable "source-metadata" {
  type = map(string)
}
variable "source-image_disk_format" { type = string }
variable "source-image_min_disk" {
  type = string 
  default = 0
}
variable "source-volume_size" { type = string }

variable "build-name" { 
  type = string 
  default = "packer"
}
variable "build-sources" { 
  type = list(string) 
}
#variable "build-provisioner-file-sources" { 
#  type = list(string) 
#}
variable "build-provisioner-file-sources-path" {
  type = string
}
variable "build-provisioner-file-destination" {
  type = string 
  default = "/tmp"
}

variable "nvidia_driver_local_repo_file_name" { type = string }
variable "nvidia_driver_local_repo_gpgkey_file_path" {
  type = string
  default = "/var"
}
variable "nvidia_driver_local_repo_gpgkey_file_name" { type = string }
variable "nvidia_driver_metapackage_name" { type = string }
variable "nvidia_fm_metapackage_name" { type = string }
variable "nvidia_fm_service_name" { type = string }
variable "nvidia_source_apt_pin_file_name" { type = string }
variable "nvidia_target_apt_pin_file_name" { type = string }
variable "apt_preference_path" {
  type = string
  default = "/etc/apt/preferences.d"
}
variable "apt_packages" {
  type = list(string)
}
variable "logs" {
  type = list(string)
  default = [
    "/var/log/wtmp",
    "/var/run/utmp",
    "/var/log/btmp",
    "/var/log/lastlog"
  ]
}

