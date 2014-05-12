MdNote.Views.Notes ?= {}

class MdNote.Views.Notes.NoteView extends Backbone.View
  className: 'new-note'
  template: JST['notes/note']

  events:
    'click .submit-note-form': 'submit'
    'click .back': 'navigateToNoteIndex'

  # Using Backbone.stickit
  bindings:
    '#input-note-title': 'title'
    '#input-note-raw_body': 'raw_body'

  render: ->
    @listenTo @model, 'sync', _.bind(@_onModelSynced, @)
    @listenTo @model, 'error', _.bind(@_onModelErrored, @)

    @$el.html @template(@model.toJSON())
