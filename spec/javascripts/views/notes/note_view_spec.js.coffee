describe 'MdNote.Views.Notes.NoteView', ->
  beforeEach ->
    @note = new MdNote.Models.Note
      id: 1
      title: 'Note Title'
      raw_body: 'body text'

  describe 'render', ->
    it "render div.new-note el for note form", ->
      view = new MdNote.Views.Notes.NoteView model: @note
      view.render()
      expect(view.$el).toHaveClass 'new-note'

    it "render PreviewView", ->
      spy = spyOn(MdNote.Views.Notes.PreviewView.prototype, 'render')

      view = new MdNote.Views.Notes.NoteView model: @note
      view.render()
      expect(spy).toHaveBeenCalled()

  describe 'click .submit-note-form', ->
    it 'trigger clickSubmit event', ->
      spy = jasmine.createSpy()

      view = new MdNote.Views.Notes.NoteView model: @note
      view.on 'clickSubmit', spy
      view.render()
      view.$('.submit-note-form').click()
      expect(spy).toHaveBeenCalled()

  describe 'click .back', ->
    it 'navigate to notes url', ->
      spy = spyOn(Backbone.history, 'navigate')

      view = new MdNote.Views.Notes.NoteView model: @note
      view.render()
      view.$('.back').trigger 'click'
      expect(spy).toHaveBeenCalledWith('/notes', true)

  describe 'model synced', ->
    it 'notifies success message', ->
      view = new MdNote.Views.Notes.NoteView model: @note
      view.render()

      expect(view.$('[data-notify-text]')).not.toContainText('Success!')
      @note.trigger 'sync'
      expect(view.$('[data-notify-text]')).toContainText('Success!')

  describe 'model errored', ->
    it 'notifies error message', ->
      view = new MdNote.Views.Notes.NoteView model: @note
      view.render()

      expect(view.$('[data-notify-text]')).not.toContainText('Error!')
      @note.trigger 'error'
      expect(view.$('[data-notify-text]')).toContainText('Error!')
