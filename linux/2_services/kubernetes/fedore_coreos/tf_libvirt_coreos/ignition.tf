# Terraform ignition configuration 
# All configuration options are detailed at
# https://www.terraform.io/docs/providers/ignition/index.html

data "ignition_config" "startup" {
  users = [
    data.ignition_user.core.rendered,
  ]

  files = [
    element(data.ignition_file.hostname.*.rendered, count.index),
  ]

  ## Relevant for the QEMU Guest Agent example
  #systemd = [
  #  "${data.ignition_systemd_unit.mount-images.rendered}",
  #  "${data.ignition_systemd_unit.qemu-agent.rendered}"
  #]
  count = var.hosts
}

# Replace the default hostname with our generated one
data "ignition_file" "hostname" {
  filesystem = "root" # default `ROOT` filesystem
  path       = "/etc/hostname"
  mode       = 420 # decimal 0644

  content {
    content = format(var.hostname_format, count.index + 1)
  }

  count = var.hosts
}

# Example configuration for the basic `core` user
data "ignition_user" "core" {
  name = "core"

  #Example password: foobar
  #password_hash = "$5$XMoeOXG6$8WZoUCLhh8L/KYhsJN2pIRb3asZ2Xos3rJla.FA1TI7"
  # Preferably use the ssh key auth instead
  ssh_authorized_keys = "${list(["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIJzEvdXFCydddmORHbe8SWDxWsdM++UF2mMP25fdvVVd670ykVMZEUnfQ31VHmu1lbO3zjEN9yXyBL1ScNpw/mesXX3yuAp0cj3nXkMog1HDkfNqTVMtYarjk/71DvX7fllJxhL0zPNHjCY3u1E1Y70PljbYI4XEhQKqVfRyRyin2jG6rr98Ni53WOosa3Zq5JeXBdvmYKVjDg9xlmzhKQ4VPjgCArhPELTqprApd29P3NCcjsCcMh2d8m6Q5iIu8axgBwf2We8kjxXbU1jmSVo5rKhs9IplgXmlPqHGZcQjH1y+s59jaI2pEH+dE6eZ3jF1e29qqsBwi8F+nHSTuJP9Rb7NZkEX+Mwh86wEvCnVnfu73GvuSoAgs+smtcpazM6G16xf5EuBV9g/zCvYAmkfsU+BzUG4KGru4WjcBbzib+Vuyi/QBi5ir1xFFR93xX/d75R2X9VSAcntGcYntNV0rgYYFO5YEwF65/uaFBjhrqOedIyFWNTIM/BBTBHVpbIrgyf864RxiMmRs/KO/gTUPNcXp2G6e/IpiyXjF5HtPzR/SzDHJ97JcQU+AYaKtm1J+2F+nsY5+kGh3gRSbGfTnS2Qik2ELd/0KerBccNXMc2Dn+H0ZmpFkBVQZOuRfWcZtYqqI5WhxjfKolakfpS2x4LNZbj910EKUywVi7Q== your_emkrasnosvar@gmail.com"])}"
}

## Relevant for the QEMU Guest Agent example
#data "ignition_systemd_unit" "mount-images" {
#  name = "mnt-images.mount"
#  enabled = true
#  content = "${file("${path.module}/qemu-agent/docker-images.mount")}"
#}
## Relevant for the QEMU Guest Agent example
#data "ignition_systemd_unit" "qemu-agent" {
#  name = "qemu-agent.service"
#  enabled = true
#  content = "${file("${path.module}/qemu-agent/qemu-agent.service")}"
#}
