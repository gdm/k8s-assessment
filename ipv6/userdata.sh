#cloud-config

hostname: ipv6.contrall.info

ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYsxOprt8COQ/6e1jKMu+BK/Zc97vaSGvcp7P7rbx0Pa1+eq5C6CVyhA+GaoBJx409HIgO0Qcmw3FxShntEMoCC8AlQdEN95owiU6Mxwj+EA9W2RQUqs5zPmQbSLl13dYcTk95PmBExXQvSotI9eBhMKpkITp0+K6XBonfnxw+Uz7Ghe3Ryje4f6+Y9rpmBgLAKUDCmE8l5yzPKJBsAUhqAMMUiUWiWt/LA6hJNYzpTNRGZDx+0//AcydjeOgZBeFATt31/Y4/Y5yVbF6xn1dcoo+ZaIhfdMlhREgiDC4/mOfd9JDe1uvgdgdnZogoE9CNma3Q6FCVjAotxHiOPI8n dmgo@dmgo-laptop

write_files:
  - content: |
      [default]
      region = eu-central-1
      cli_pager =

      [preview]
      sdb = true

    path: /root/.aws/config
    permissions: '0640'
    owner: "root:root"
  - content: |
      #!/bin/bash -xe
      echo "Bootstrap (skip) ..."

    path: /root/bootstrap/init.sh
    permissions: '0740'
    owner: "root:root"

runcmd:
  - [ /bin/bash, -xe, /root/bootstrap/init.sh ]

