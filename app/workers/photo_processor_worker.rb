class PhotoProcessorWorker
  include Sidekiq::Worker

  def perform(photo_id, path, remote_url)
    photo = Photo.find(photo_id)
    photo.remote_picture_url = remote_url
    photo.save

    Amazon.delete_tmp_file(path)

    photo.update("processing_status", "finished")
  end
end
