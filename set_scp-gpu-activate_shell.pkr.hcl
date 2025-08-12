locals {
  set_scp-gpu-activate_shell = <<-EOF
    #!/bin/bash
    sudo mv /tmp/${var.scp-gpu-activate_shell_name} /root/scp-gpu-activate.sh
    sudo chown root:root /root/scp-gpu-activate.sh
    sudo chmod +x /root/scp-gpu-activate.sh
  EOF
}
