describe 'MdNote.Views.Notes.IndexItemView', ->
  beforeEach ->
    @note = new MdNote.Models.Note
      id: 1
      title: 'Note Title'
      raw_body: 'body text'

  describe 'render', ->
    it 'render li element for note object', ->
      view = new MdNote.Views.Notes.IndexItemView model: @note
      view.render()
      expect(view.$el).toBeTruthy()
      expect(view.$el).toHaveId 'note-1'
      expect(view.$el.find('a')).toHaveClass 'note-title'

      expect(view.$('.note-title')).toContainText 'Note Title'
      expect(view.$('.note-preview')).toContainText 'body text'

  describe 'click .note-title', ->
    it 'navigate to the note url', ->
      spy = spyOn(Backbone.history, 'navigate')

      view = new MdNote.Views.Notes.IndexItemView model: @note
      view.render()
      view.$('.note-title').trigger 'click'
      expect(spy).toHaveBeenCalledWith('/notes/1', true)

  describe 'click .delete-note', ->
    it 'invoke this.model destroy', ->
      spy = spyOn(@note, 'destroy')
      spyOn(window, 'confirm').andCallFake ->
        return true

      view = new MdNote.Views.Notes.IndexItemView model: @note
      view.render()
      view.$('.delete-note').trigger 'click'
      expect(spy).toHaveBeenCalled()
