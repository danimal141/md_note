describe 'MdNote.Models.Note', ->
  describe 'previewText', ->
    it 'return max 140 characters', ->
      text = ''
      for i in [0..140]
        text += 'a'

      note = new MdNote.Models.Note(
        raw_body: text
      )
      expect(note.get('raw_body').length).toEqual 141
      expect(note.previewText().length).toEqual 140
