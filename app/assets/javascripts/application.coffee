#= require jquery
#= require jquery_ujs
#= require foundation
#= require s3_direct_upload
#= require album
#= require_tree .

$ ->
  $(document).foundation()

  window.AlbumPage = new window.Album

  $('img').on 'load', ->
    $(@).parents('li').show()
