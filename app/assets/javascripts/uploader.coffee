class @UploaderForm
  uploaderForm: $("#s3-uploader")

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    window.App.Uploader = @uploaderForm.S3Uploader
      additional_data:
        album_id: "123"
      progress_bar_target: $(".uploader-progress-bars")
      remove_completed_progress_bar: false