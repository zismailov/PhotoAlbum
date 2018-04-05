class @PhotoAlbum

  uploaderForm: $("#s3-uploader")
  photosContainer: $('.photos')

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    if @photosContainer?
      @uploaderForm.S3Uploader
        additional_data: { album_id: @photosContainer.data('album_id') }
