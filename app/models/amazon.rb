class Amazon
  TMP_BUCKET = "photoalbum-tmp".freeze

  def self.delete_tmp_file(filepath)
    s3 = AWS::S3.new
    s3.buckets["photoalbum-tmp"].objects[filepath.gsub("/#{TMP_BUCKET}/", "")].delete
  end
end
