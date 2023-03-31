#readme
#CREATE A FIRESTORE NATIVE DATABASE
provider "google" {
  project	= "montreal-project-mcit"
  region	= "northamerica-northeast1"
  zone		= "northamerica-northeast1-a"
}

resource "google_firestore_database" "database" {
  project     = "montreal-project-mcit"
  name        = "(default)"
  location_id = "northamerica-northeast1"
  type        = "FIRESTORE_NATIVE"
}
