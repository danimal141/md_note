MdNote.Views.Notes ?= {}

class MdNote.Views.Notes.PreviewView extends Backbone.View
  template: JST['notes/preview']

  bindings:
    '#note-title': 'title'

  initialize: ->
    @listenTo @model, 'change:body', _.bind(@_updatePreview, @)

  render: ->
    @$el.html @template(@model.toJSON())
    @_updatePreview()
    @stickit()
    this

  _updatePreview: ->
    @$('#note-body').html @model.get('body')
