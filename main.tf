module "coding_challenge" {
  source = "./modules/coding_challenge/"

  bucket_name       = var.bucket_name
  topic_name        = var.topic_name
  topic_subscribers = var.topic_subscribers

  tags = {
    project = var.project
  }
}
