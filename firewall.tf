resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http-terraform"
  network = "network-instance"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "ssh-server" {
  name    = "default-allow-ssh-terraform"
  network = "network-instance"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  // Allow traffic from everywhere to instances with an ssh-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-server"]
}