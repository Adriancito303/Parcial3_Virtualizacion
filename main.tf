terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Definición del primer contenedor
resource "docker_container" "landing" {
  name  = "HWSPANGINX"
  image = "frontend:latest"
  ports {
    internal = 80
    external = 8001
  }
}

# Definición del segundo contenedor
resource "docker_container" "hola" {
  name  = "HWAPINGINX"
  image = "backend:latest"
  ports {
    internal = 5000
    external = 5000
  }
}

# Definición del tercer contenedor
resource "docker_container" "mongodb" {
  name  = "NoRelacional"
  image = "bitnami/mongodb:latest"
  ports {
    internal = 27017
    external = 27017
  }
}
