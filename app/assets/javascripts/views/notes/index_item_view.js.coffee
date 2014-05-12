MdNote.Views.Notes ?= {}

class MdNote.Views.Notes.IndexItemView extends Backbone.View
  tagName: 'li'
  id: -> "note-#{@model.id}"
  className: 'note'
  template: JST['notes/index_item']

  events:
    'click .note-title': 'navigateToNote'
    'click .delete-note': 'deleteNote'

  initialize: ->
    @listenTo @model, 'destroy', =>
      @remove()

  render: ->
    context = @model.toJSON()
    _.extend(context, previewText: @model.previewText())
    @$el.html @template(context)
    this

  navigateToNote: (e) ->
    e.preventDefault()
    Backbone.history.navigate("notes/#{@model.id}", true)

  deleteNote: (e) ->
    e.preventDefault()
    @model.destroy() if confirm('ノートを削除しますか？')
