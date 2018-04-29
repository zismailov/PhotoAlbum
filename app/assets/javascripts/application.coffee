#= require jquery
#= require jquery_ujs
#= require jquery-ui/widgets/sortable
#= require foundation
#= require s3_direct_upload
#= require album
#= require_tree .

$ ->
  $(document).foundation()

  window.AlbumPage = new window.Album
