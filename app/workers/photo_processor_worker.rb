class PhotoProcessorWorker
  include Sidekiq::Worker

  def perform(_params)
    photo = current_user.photos.new title: photo_title

    photo.update_attribute("processing_status", "in_progress")

    photo.remote_picture_url = photo_remote_url
    photo.save

    Amazon.delete_tmp_file(photo_file_path)

    photo.update_attribute("processing_status", "finished")
  end

  def photo_title
    File.basename(params[:filename], File.extname(params[:filename]))
  end

  def photo_file_path
    URI.decode_www_form params[:filepath]
  end

  def photo_remote_url
    URI.decode_www_form photo_params[:remote_picture_url]
  end
end
