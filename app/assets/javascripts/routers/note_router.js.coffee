class MdNote.Routers.NoteRouter extends Backbone.Router
  routes:
    'notes/new': 'newNote'
    'notes/id': 'showNote'
    'notes': 'indexNotes'
    '.*': 'indexNotes'

  initialize: (options) ->
    @layout = new MdNote.Views.LayoutView(el: $('body'))
    @notes = new MdNote.Collections.Notes()

  indexNotes: ->
    indexView = new MdNote.Views.Notes.IndexView(collection: @notes)
    @layout.setView indexView

    @notes.fetch reset: true

  newNote: ->
    @note = new MdNote.Models.Note()
    @__renderNoteView()
    @listenTo @note, 'sync', (note) =>
      @navigate 'notes', true
      @stopListening note

  showNote: (id) ->
    @note = @notes.get id
    if @note
      @__renderNoteView
    else
      @note = new MdNote.Models.Note id: id
      @note.fetch
        success: => @__renderNoteView()

  __renderNoteView: ->
    noteView = new MdNote.Views.Notes.NoteView model: @note
    @layout.setView noteView
    @listenTo @layout.currentView, 'clickSubmit', =>
      @note.save()
