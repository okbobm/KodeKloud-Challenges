# Start a container
resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  image = phpmyadmin/phpmyadmin
  hostname = phpmyadmin
  networks_advanced {
    name = "my_network"
  }
  depends_on = [
    "mariadb"
  ]
  labels {
    label = "challenge"
    value = "second"
  }
  ports {
    internal = "80"
    external = "8081"
    ip       = "0.0.0.0"
  }
}
