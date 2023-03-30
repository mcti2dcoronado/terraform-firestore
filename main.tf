#readme
#CREATE A FIRESTORE NATIVE DATABASE
provider "google" {
  credentials = file("credentials.json")
}

resource "google_firestore_database" "database" {
  project     = "montreal-project-mcit"
  name        = "(default)"
  location_id = "northamerica-northeast1"
  type        = "FIRESTORE_NATIVE"
}
