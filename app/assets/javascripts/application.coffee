#= require jquery
#= require jstree
#= require jquery_ujs
#= require jquery-ui/sortable
#= require foundation
#= require s3_direct_upload
#= require_tree .

$ ->
  $(document).foundation()

  $(".albums-jstree-view").on "changed.jstree", (e, data) ->
    id = data.changed.selected
    album_id = $("##{id}").data('album-id')

    if album_id != undefined
      $.ajax
        url: "/albums/#{album_id}"
        dataType: "script"

  $(".albums-jstree, .albums-jstree-view").jstree
    "core":
      "animation": 0
    "plugins": [ "wholerow", "changed", "dnd" ]

  window.AlbumPage = new window.Album
  window.Uploader = new window.Uploader