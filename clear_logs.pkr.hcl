locals {
  clear_logs = <<-EOF
    #!/bin/bash
    %{ for log in var.logs ~}
        if [ -f ${log} ];then
          sudo truncate -s 0 ${log}
        fi
    %{ endfor ~}
    sudo find /var/log -type f -iname '*.log' -print0| xargs -0 sudo truncate -s 0 
    sudo rm -f /var/log/dmesg.0
    sudo rm -rf /var/log/unattended-upgrades
    sudo lastlog -C -u ubuntu
    truncate -s 0 ~/.bash_history 
  EOF
}
