#= require jquery
#= require jquery_ujs
#= require foundation
#= require s3_direct_upload
#= require photoalbum
#= require_tree .

$ ->
  $(document).foundation()

  window.PhotoAlbum = new PhotoAlbum
