MdNote.Views.Notes ?= {}

class MdNote.Views.Notes.IndexView extends Backbone.View
  template: JST['notes/index']

  events:
    'click a.new-note-btn': 'navigateToNewNote'

  initialize: (@options) ->
    @listenTo @collection, 'reset', =>
      @render()

  render: ->
    @$el.html @template()
    @collection.each (note) =>
      view = new MdNote.Views.Notes.IndexItemView(model: note)
      @$('#notes').append(view.render().el)
    this

  navigateToNewNote: ->
    Backbone.history.navigate('/notes/new', true)
