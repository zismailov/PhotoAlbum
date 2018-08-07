class @Uploader

  uploaderForm:        $("#s3-uploader")

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    @uploaderForm.S3Uploader
      additional_data:
        album_id: ""
      progress_bar_target: $(".uploader-progress-bars")
      remove_completed_progress_bar: true