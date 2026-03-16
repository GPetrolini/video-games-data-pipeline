terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {

  credentials = file("/home/gustavo/projetos/DE-zoomcamp-project/orchestration/credentials/google_credentials.json")
  project = "de-zoomcamp-484312"
  region  = "us-central1"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name          = "dtc-de-course-bucket-gustavo-2026"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  storage_class = "STANDARD"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "video_game_data"
  project    = "de-zoomcamp-484312"
  location   = "US"
}