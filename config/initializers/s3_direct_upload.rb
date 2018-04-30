S3DirectUpload.config do |c|
  c.access_key_id     = ENV["S3_ACCESS_KEY_ID"]
  c.secret_access_key = ENV["S3_SECRET_KEY_ID"]
  c.bucket = "photoalbum-tmp"
  c.region = ENV["us-east-1"]
  c.url = nil
end
