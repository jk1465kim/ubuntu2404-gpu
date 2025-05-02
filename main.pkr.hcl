source "openstack" "ubuntu1" {
  cloud = "${var.source-cloud}"
  endpoint_type = "${var.source-endpoint_type}"
  flavor       = "${var.source-flavor}"
  image_name   = "${var.source-image_name}"
  source_image = "${var.source-source_image}"
  instance_name = "${var.source-instance_name}"
  ssh_username = "${var.source-ssh_username}"
  ssh_private_key_file = "${var.source-ssh_private_key_file}"
  ssh_keypair_name = "${var.source-ssh_keypair_name}"
  networks = "${var.source-networks}"
  floating_ip = "${var.source-floating_ip}"
  user_data = file("${var.source-user_data}")
  metadata = "${var.source-metadata}"
  image_disk_format = "${var.source-image_disk_format}"
  image_min_disk = "${var.source-image_min_disk}"
  use_blockstorage_volume = true
  volume_size = "${var.source-volume_size}"
}

build {
  name = "${var.build-name}"
  sources = "${var.build-sources}"
  provisioner "file" {
    sources = "${var.build-provisioner-file-sources}"
    destination = "${var.build-provisioner-file-destination}"
  }
  provisioner "shell" {
  inline = [
  "sudo /usr/bin/cloud-init status --wait",
  local.install_nvidia_driver,
  local.remove_apt_packages,
  "sudo /usr/bin/cloud-init clean",
  local.clear_logs
  ]
  }
}
