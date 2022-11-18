terraform {
  required_providers {
    gandi = {
      source = "go-gandi/gandi"
      version = "2.2.0"
    }
  }

  backend "remote" {
    organization = "gliwka"
    workspaces {
      name = "infrastructure"
    }
  }
}

provider "gandi" {}