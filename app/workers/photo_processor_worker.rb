class PhotoProcessorWorker
  include Sidekiq::Worker

  def perform(album_id, title, path, remote_url)
    photo = Photo.new title: title,
                      album_id: album_id,
                      processing_status: "in_progress"

    photo.remote_picture_url = remote_url
    photo.save

    Amazon.delete_tmp_file(path)

    photo.update_attribute("processing_status", "finished")
  end
end
