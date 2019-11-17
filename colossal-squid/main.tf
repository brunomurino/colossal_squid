terraform {
  backend "gcs" {
    bucket  = "colossal-squid-terraform-state-prod"
    prefix  = "terraform/state"
    credentials = "colossal-squid-8c6f897419bb.json"
  }

  required_providers {
    google = "~> 3.0"
  }
}

provider "google" {
  credentials = file("colossal-squid-8c6f897419bb.json")
  project = "colossal-squid"
  region  = "us-central1"
  zone    = "us-central1-c"
}