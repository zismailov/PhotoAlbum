CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = "photoalbum-#{Rails.env}"
  config.aws_acl    = "public-read"

  config.aws_credentials = {
    access_key_id:     ENV["S3_ACCESS_KEY_ID"],
    secret_access_key: ENV["S3_SECRET_KEY_ID"]
  }

  config.asset_host = ENV["CLOUDFRONT_URL"] if Rails.env.production?

  # config.aws_authenticated_url_expiration = 60 * 60
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
