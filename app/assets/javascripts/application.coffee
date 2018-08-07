#= require jquery
#= require jstree
#= require jquery_ujs
#= require jquery-ui/sortable
#= require foundation
#= require s3_direct_upload
#= require_tree .

$ ->
  $(document).foundation()

  window.App = {}

  window.App.AlbumPage = new window.Album
  window.App.UploaderForm = new window.UploaderForm
  window.App.AlbumsTree = new window.AlbumsTree