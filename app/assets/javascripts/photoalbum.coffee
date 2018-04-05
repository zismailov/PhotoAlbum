class @PhotoAlbum

  uploaderForm:       $("#s3-uploader")
  photosContainer:    $(".photos")
  openUploaderButton: $(".open-uploader-button")
  fileInput:          $("input#file")

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    if @photosContainer?
      @uploaderForm.S3Uploader
        additional_data: { album_id: @photosContainer.data('album_id') }
      @openUploaderButton.on 'click', (e) =>
        e.preventDefault()
        @fileInput.trigger("click")
