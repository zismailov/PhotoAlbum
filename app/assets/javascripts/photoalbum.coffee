class @PhotoAlbum

  uploaderForm:       $("#s3-uploader")
  photosContainer:    $(".photos")
  fileInput:          $("input#file")

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    if @photosContainer?
      @uploaderForm.S3Uploader
        additional_data: { album_id: @photosContainer.data('album_id') }
        progress_bar_target: $(".uploader-progress-bars")
        remove_completed_progress_bar: false
