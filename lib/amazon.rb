class Amazon
  TMP_BUCKET = "photoalbum-tmp".freeze

  def self.delete_tmp_file(filepath)
    Aws.config.update parameters

    s3 = Aws::S3::Resource.new
    bucket = s3.bucket("photoalbum-tmp")

    bucket.object(filepath.gsub("/#{TMP_BUCKET}/", "")).delete
  end

  def region
    ENV["AWS_REGION"]
  end

  def credentials
    Aws::Credentials.new(ENV["S3_ACCESS_KEY_ID"], ENV["S3_SECRET_KEY_ID"])
  end

  def parameters
    { region: region, credentials: credentials }
  end
end
