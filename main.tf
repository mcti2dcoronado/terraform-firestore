#readme
#CREATE A FIRESTORE NATIVE DATABASE
provider "google" {
  region	= "northamerica-northeast1"
  zone		= "northamerica-northeast1-a"
  org_id        = "123456789"
}

resource "random_string" "random_suffix" {
  length  = 3
  special = false
  upper   = false
}

resource "google_project" "project" {
  project_id	= "project-firestore-mtl-${random_string.random_suffix.result}"
  name		= "project-firestore-mtl"
}

resource "time_sleep" "wait_60_seconds" {
  depends_on	= [google_project.project]
  create_duration = "60s"
}

resource "google_project_service" "firestore" {
  project 	= google_project.project.project_id
  service 	= "firestore.googleapis.com"

  depends_on 	= [time_sleep.wait_60_seconds]
}

resource "google_firestore_database" "database" {
  project     			= "google_project.project.project_id"
  name        			= "(default)"
  location_id 			= "northamerica-northeast1"
  type        			= "FIRESTORE_NATIVE"
  concurrency_mode		= "OPTIMISTIC"
  app_engine_integration_mode 	= "DISABLED"

  depends_on 			= [google_project_service.firestore]
}
