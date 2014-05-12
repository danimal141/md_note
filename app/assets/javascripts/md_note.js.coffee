window.MdNote =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new MdNote.Routers.NoteRouter
    Backbone.history.start(pushState: true)

$(document).ready ->
  MdNote.initialize()
