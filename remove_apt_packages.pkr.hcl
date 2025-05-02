locals {
  remove_apt_packages = <<-EOF
    #!/bin/bash
    sudo rm -f /var/log/unattended-upgrades/*
    %{ for package in var.apt_packages ~}
       sudo apt-get purge -y ${package}
    %{ endfor ~}
  EOF
}
