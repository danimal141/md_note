describe 'MdNote.Views.Notes.IndexView', ->
  beforeEach ->
    @collection = new MdNote.Collections.Notes()

  describe 'render', ->
    it 'render el that has ul.notes and a.new-note-btn', ->
      view = new MdNote.Views.Notes.IndexView collection: @collection
      view.render()
      expect(view.$el).toBeTruthy()
      expect(view.$('ul')).toHaveClass 'notes'
      expect(view.$('a')).toHaveClass 'new-note-btn'

  describe 'click .new-note-btn', ->
    it 'navigate to new_note path', ->
      spy = spyOn(Backbone.history, 'navigate')

      view = new MdNote.Views.Notes.IndexView collection: @collection
      view.render()
      view.$('.new-note-btn').trigger 'click'
      expect(spy).toHaveBeenCalledWith('/notes/new', true)
