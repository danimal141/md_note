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
    preview = new MdNote.Views.Notes.PreviewView(model: @model, el: @$('.preview-col'))
    preview.render()
    @stickit()
    this

  submit: (e) ->
    e.preventDefault()
    @trigger 'clickSubmit'

  navigateToNoteIndex: (e) ->
    e.preventDefault()
    Backbone.history.navigate('/notes', true)

  _onModelSynced: ->
    @$('.submit-note-form').notify('Success!', className: 'success', position: 'right')

  _onModelErrored: ->
    @$('.submit-note-form').notify('Error!', className: 'error', position: 'right')

