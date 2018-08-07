class @AlbumTree
   ui:
    albums_tree_container: $('.albums_tree')
   constructor: ->
    @initializeAlbumsTree()
   initializeAlbumsTree: ->
    @ui.albums_tree_container.jstree
      core:
        multiple: false
      plugins: ["wholerow"]
     @ui.albums_tree_container.on "changed.jstree", (e, data) ->
      album_id = $("##{data.selected[0]}").data("album-id")
      window.location.href = "/albums/#{album_id}"