output "github-repo" {
  description = "Github Repo"
  value = var.github-new-repo ? github_repository.gh-repo[0].http_clone_url : data.github_repository.gh-repo-data[0].http_clone_url
}