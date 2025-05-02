locals {
#  nvidia_driver_local_repo_file_name = "nvidia-driver-local-repo-ubuntu2204-535.183.06_1.0-1_amd64.deb"
#  nvidia_driver_local_repo_gpgkey = "/var/nvidia-driver-local-repo-ubuntu2204-535.183.06/nvidia-driver-local-*.gpg"
#  nvidia_driver_metapackage_name = "nvidia-driver-535" 
#  nvidia_fm_metapackage_name = "nvidia-fabricmanager-535"
#  nvidia_fm_service_name = "nvidia-fabricmanager"
#  nvidia_apt_pin_file_name = "nvidia"
  install_kernel = <<-EOF
    #!/bin/bash
    sudo apt-get install -y linux-generic
  EOF
}
