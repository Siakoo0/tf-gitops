locals {
  docker_registry = google_artifact_registry_repository.gartifact-registry.name
}

resource "google_cloudbuild_trigger" "gcp-trigger" {
    name = "cloudbuild-trigger-gitops"
    location = "us-central1"

    filename = "pipe/ci/cloudbuild.yaml"

    repository_event_config {
        repository = google_cloudbuildv2_repository.gh-repo.id

        push {
          branch = ".*"
        }
    }

    substitutions = {
      _IMAGE_NAME = "us-central1-docker.pkg.dev/${var.project}/${local.docker_registry}/terraform-build"
    }
}