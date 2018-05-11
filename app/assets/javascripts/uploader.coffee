class @Uploader

  uploaderForm: $("#s3-uploader")
  fileInput: $("input#file")

  constructor: ->
      @initializeUploader()
      @initializeAlbumsTree()

  initializeUploader: ->
    @uploaderForm.S3Uploader
      additional_data:
        album_id: ""
      progress_bar_target: $(".uploader-progress-bars")
      remove_completed_progress_bar: true

  initializeAlbumsTree: ->
    $('#albums_tree').jstree()
