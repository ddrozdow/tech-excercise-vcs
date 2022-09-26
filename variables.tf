variable "project_id" {
    default = "hashicorp-361616"
}

variable "region" {
    default = "us-central1"
}

variable "zone" {
    default = "us-central1-c"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}