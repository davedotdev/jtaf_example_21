provider "junos-device" {
    host = "localhost"
    port = 2200
    username = "nc"
    password = "Passw0rd"
    sshkey = ""
}

module "qfx_1" {
  source = "./qfx_1"

  providers = {
    junos-device = junos-device
  }
}

resource "junos-device_commit" "commit-main" {
  resource_name = "commit"
  depends_on = [module.qfx_1]
}
