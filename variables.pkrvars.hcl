source-cloud = "openstack"
source-endpoint_type = "internal" 
source-flavor = "c2m4d10"
source-image_name = "ubuntu-24.04-LTS-20250725_580.65.06"
source-source_image = "ubuntu-24.04-LTS-20250725"
source-instance_name = "scp"
source-ssh_username = "ubuntu"
source-ssh_private_key_file = "/root/jk1465.kim/jk1465-key.pem"
source-ssh_keypair_name = "jk1465-key"
source-networks = ["4e7104f1-7efb-4338-a804-5d6ba9dab3ed"]
source-floating_ip = "9977ce1b-bc64-4752-8208-c22cbefb5fec"
source-user_data = "/root/jk1465.kim/files/userdata"
source-metadata = {
    "builder" : "packer",
    "os_type" : "linux",
    "os_distro" : "ubuntu",
    "scp_original_image_type" : "gpu_standard",
    "scp_image_type" : "gpu_standard",
    "scp_os_version" : "24.04"
  }
source-image_disk_format = "qcow2"
#source-image_min_disk = 0
source-volume_size = "10"

# install_nvidia_driver 
nvidia_driver_local_repo_file_name = "nvidia-driver-local-repo-ubuntu2404-580.65.06_1.0-1_amd64.deb"
nvidia_driver_local_repo_gpgkey_file_path = "/var/nvidia-driver-local-repo-ubuntu2404-580.65.06"
nvidia_driver_local_repo_gpgkey_file_name = "nvidia-driver-local-*.gpg"
nvidia_driver_metapackage_name = "nvidia-driver-580"
nvidia_fm_metapackage_name = "nvidia-fabricmanager-580 libnvidia-nscq-580 libnvsdm-580"
nvidia_fm_service_name = "nvidia-fabricmanager"
nvidia_source_apt_pin_file_name = "cuda-ubuntu2404.pin"
nvidia_target_apt_pin_file_name = "nvidia-pin"
apt_preference_path = "/etc/apt/preferences.d"

scp-gpu-activate_shell_name="scp-gpu-activate-ubuntu.sh"

#build-name = "packer"
build-sources = ["source.openstack.ubuntu1"]
build-provisioner-file-sources-path = "/root/jk1465.kim/files"
#build-provisioner-file-sources = [
#  "${var.build-provisioner-file-sources-path}/${var.nvidia_driver_local_repo_file_name}",
#  "${var.build-provisioner-file-sources-path}/${nvidia_source_apt_pin_file_name}"
#]
build-provisioner-file-destination = "/tmp/"

# clear_logs
logs = [
    "/var/log/wtmp",
    "/var/run/utmp",
    "/var/log/btmp",
    "/var/log/lastlog"
]

# remove_apt_packages
apt_packages = [
  "unattended-upgrades",
  "nvidia-driver-local-repo*"
]
