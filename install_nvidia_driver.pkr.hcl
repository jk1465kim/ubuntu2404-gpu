locals {
  install_nvidia_driver = <<-EOF
    #!/bin/bash
    sudo dpkg -i ${var.build-provisioner-file-destination}/${var.nvidia_driver_local_repo_file_name}
    sudo cp ${var.nvidia_driver_local_repo_gpgkey_file_path}/${var.nvidia_driver_local_repo_gpgkey_file_name} /usr/share/keyrings/
    sudo cp ${var.build-provisioner-file-destination}/${var.nvidia_source_apt_pin_file_name} ${var.apt_preference_path}/${var.nvidia_target_apt_pin_file_name}
    sudo apt-get update
    sudo apt-get install -y ${var.nvidia_driver_metapackage_name} ${var.nvidia_fm_metapackage_name}
    sudo systemctl enable ${var.nvidia_fm_service_name}
    sudo rm -f ${var.apt_preference_path}/${var.nvidia_target_apt_pin_file_name}
    sudo rm -f ${var.build-provisioner-file-destination}/${var.nvidia_driver_local_repo_file_name}
  EOF
}
