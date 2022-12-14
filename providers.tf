terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.34.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"  
    }
    system = {
      source = "neuspaces/system"
    }
  }
}

data "google_client_config" "provider" {

}

data "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke-vcs"
  location = var.region
  
}

provider "google" {
  credentials = var.gcp-creds

  project = "hashicorp-361616"
  region  = "us-central1"
  zone    = "us-central1-c"
}
terraform {
  cloud {
    organization = "example-org-8ad09e"

    workspaces {
      name = "tech-excercise-vcs"
    }
  }
}