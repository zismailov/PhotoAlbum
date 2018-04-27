class @Album

  uploaderForm:        $("#s3-uploader")
  photosContainer:     $("ul.photos")
  thumbnailContainer:  $("li.photo-thumbnail")
  fileInput:           $("input#file")

  album:
    id: $("ul.photos").data("album-id")

  constructor: ->
    @initializeUploader()
    if $("ul.photos").length > 0
      @initializePhotosSorting()
      @savePhotosOrder()

  initializeUploader: ->
    @uploaderForm.S3Uploader
      additional_data:
        album_id: @photosContainer.data('album-id')
      progress_bar_target: $(".uploader-progress-bars")
      remove_completed_progress_bar: true

    @thumbnailContainer.on 'mouseenter', (e) ->
      $(@).find('.photo-actions').fadeIn()

    @thumbnailContainer.on 'mouseleave', (e) ->
      $(@).find('.photo-actions').fadeOut()

  initializePhotosSorting: =>
    @photosContainer.sortable
      stop: @savePhotosOrder

  savePhotosOrder: =>
    ids = $("li.photo-thumbnail").map (i,el,arr) ->
      $(el).data('id')
    $.ajax
      url: "/albums/#{@album.id}"
      method: "PATCH"
      dataType: "script"
      data:
        album:
          photos_order: ids.toArray()
