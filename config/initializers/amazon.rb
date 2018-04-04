S3DirectUpload.config do |c|
  c.access_key_id     = ENV["S3_ACCESS_KEY_ID"]
  c.secret_access_key = ENV["S3_SECRET_KEY_ID"]
  c.bucket = "photoalbum-tmp"
  c.region = nil
  c.url = nil
end

Aws.config.update(
  access_key_id:     ENV["S3_ACCESS_KEY_ID"],
  secret_access_key: ENV["S3_SECRET_KEY_ID"]
)
