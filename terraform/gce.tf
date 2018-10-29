# Configure the Google Compute Engine Instance
#=============================================================================
# gce
#=============================================================================
resource "google_compute_instance" "vm" {
  name = "test-vm"

  machine_type = "f1-micro"
  zone         = "asia-northeast1-b"
  tags = ["http-server"]
  allow_stopping_for_update = "true"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
   subnetwork = "default"
   access_config {
   }
  }
}
