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

  describe 'renderBody', ->
    beforeEach -> jasmine.Ajax.useMock()

    it 'fetch rendered HTML from /notes/rendering and set body attributes', ->
      note = new MdNote.Models.Note(raw_body: "## head2")
      note.renderBody()
      request = mostRecentAjaxRequest()
      expect(request.url).toEqual '/notes/rendering'
      expect(request.method).toEqual 'POST'
      expect(request.data()).toEqual { raw_body : [ '## head2' ] }
      request.response
        status: 200
        responseText: '{"body": "<h2>head2</h2>"}'
      expect(note.get('body')).toEqual "<h2>head2</h2>"
