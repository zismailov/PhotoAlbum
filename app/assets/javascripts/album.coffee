class @Album
  photosContainer:     $("ul.photos")
  thumbnailContainer:  $("li.photo-thumbnail")

  album:
    id: $("ul.photos").data("album-id")

  constructor: ->
    if $("ul.photos").length > 0
      @initializePhotosSorting()
      @savePhotosOrder()

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
