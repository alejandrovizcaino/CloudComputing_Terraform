provider "google" {
	credentials = file("/home/alex/MI-CC2021/terraform/credenciales-terraform.json")
	project = "947072184123"
	region = "europe-west1"
	zone = "europe-west1-b"
}