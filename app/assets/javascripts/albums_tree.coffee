class @AlbumsTree

  treeContainer: $(".albums-tree")

  constructor: ->
    @initializeTree()
    @bindEvents()

  initializeTree: ->
    @treeContainer.jstree
      "core":
        "animation": 0
      "plugins": [ "wholerow", "changed", "dnd" ]
    @treeContainer.jstree("open_all")

  bindEvents: ->
    $(".albums-tree[data-behavior='show-album']").on "changed.jstree", @showAlbum
    $(".albums-tree[data-behavior='select-album']").on "changed.jstree", @selectAlbum

  selectAlbum: (e, data) ->
    id = data.changed.selected
    album_id = $("##{id}").data('album-id')
    album_title = $("##{id}").data('album-title')

    $("span.selected-album-title").html("Фотографии будут загружены в <strong>" + album_title + "</strong>")

    window.App.Uploader.additional_data({album_id: album_id})

  showAlbum: (e, data) ->
    id = data.changed.selected
    album_id = $("##{id}").data('album-id')

    if album_id != undefined
      $.ajax
        url: "/albums/#{album_id}"
        dataType: "script"
