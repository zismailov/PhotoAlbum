class window.Album

  uploaderForm:    $("#s3-uploader")
  photosContainer: $("li.photos")
  photoContainer:  $("li.photo")
  fileInput:       $("input#file")

  constructor: ->
    @initializeUploader()

  initializeUploader: ->
    @uploaderForm.S3Uploader
      additional_data:
        album_id: @photosContainer.data('album-id')
      progress_bar_target: $(".uploader-progress-bars")
      remove_completed_progress_bar: false

    @photoContainer.on 'mouseenter', (e) ->
      $(@).find('.photo-actions').fadeIn()

    @photoContainer.on 'mouseleave', (e) ->
      $(@).find('.photo-actions').fadeOut()
