resource "google_compute_instance" "mi-recurso-google" {
  name         = "webserver-tf"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20200129a"
    }
  }

  network_interface {
    network = "network-instance"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata = {
      sshKeys = file("~/.ssh/id_rsa.pub")
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install apache2 -y; sudo apt install php7.2-cli -y; echo '<!doctype html><html><body><h1>Hola mundo</h1></body></html>' | sudo tee /var/www/html/index.html"
  
  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "ssh-server"]
}