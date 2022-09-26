terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = true
}

resource "docker_image" "httpd" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "httpd" {
  image    = docker_image.httpd.latest
  name     = "foo"
  hostname = "webserver"
  ports {
    internal = 80
    external = 80
  }
}
