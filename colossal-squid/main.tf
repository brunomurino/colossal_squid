terraform {
  backend "gcs" {
    bucket  = "colossal-squid-terraform-state-prod"
    prefix  = "terraform/state"
    credentials = "colossal-squid-8c6f897419bb.json"
  }
}

# https://learn.hashicorp.com/terraform/gcp/build
provider "google" {
  credentials = file("colossal-squid-8c6f897419bb.json")
  project = "colossal-squid"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "colossal_squid_test_bucket" {
  name     = "colossal-squid-test-bucket"
  location = "us-central1"
}

resource "google_bigquery_dataset" "colossal_squid_db" {
  dataset_id                  = "colossalsquiddb"
  friendly_name               = "colossal-squid-db"
  description                 = "This is a test description"
  location                    = "US"
}