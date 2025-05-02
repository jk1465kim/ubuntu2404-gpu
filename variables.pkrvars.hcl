source-cloud = "openstack"
source-endpoint_type = "internal" 
source-flavor = "c2m4d10"
source-image_name = "ubuntu-22.04-LTS-20250115_535.183.06"
source-source_image = "ubuntu-22.04-LTS-20250115"
source-instance_name = "scp"
source-ssh_username = "ubuntu"
source-ssh_private_key_file = "files/jk1465-key.pem"
source-ssh_keypair_name = "jk1465-key"
source-networks = ["4e7104f1-7efb-4338-a804-5d6ba9dab3ed"]
source-floating_ip = "3b7b78e6-7772-451b-aec5-748e5ccd8eed"
source-user_data = "files/userdata"
source-metadata = {
    "builder" : "packer",
    "os_type" : "linux",
    "os_distro" : "ubuntu",
    "scp_original_image_type" : "gpu_standard",
    "scp_image_type" : "gpu_standard",
    "scp_os_version" : "22.04"
  }
source-image_disk_format = "qcow2"
#source-image_min_disk = 0
source-volume_size = "10"
#build-name = "packer"
build-sources = ["source.openstack.ubuntu1"]
build-provisioner-file-sources = [
  "files/nvidia-driver-local-repo-ubuntu2204-535.183.06_1.0-1_amd64.deb",
  "files/cuda-ubuntu2204.pin"
]
build-provisioner-file-destination = "/tmp/"

# install_nvidia_driver 
nvidia_driver_local_repo_file_name = "nvidia-driver-local-repo-ubuntu2204-535.183.06_1.0-1_amd64.deb"
nvidia_driver_local_repo_gpgkey_file_path = "/var/nvidia-driver-local-repo-ubuntu2204-535.183.06"
nvidia_driver_local_repo_gpgkey_file_name = "nvidia-driver-local-*.gpg"
nvidia_driver_metapackage_name = "nvidia-driver-535"
nvidia_fm_metapackage_name = "nvidia-fabricmanager-535"
nvidia_fm_service_name = "nvidia-fabricmanager"
nvidia_source_apt_pin_file_name = "cuda-ubuntu2204.pin"
nvidia_target_apt_pin_file_name = "nvidia-pin"
apt_preference_path = "/etc/apt/preferences.d"

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

