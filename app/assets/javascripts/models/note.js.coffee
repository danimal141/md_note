class MdNote.Models.Note extends Backbone.Model
  urlRoot: '/notes'

  initialize: ->
    @listenTo @, 'change:raw_body', _.debounce =>
      @renderBody()
    , 300

  previewText: (length = 140) ->
    @get('raw_body')?.substring(0, length)

  renderBody: ->
    $.ajax
       url: '/notes/rendering'
       type: 'POST'
       data: {raw_body: @get('raw_body')}
       dataType: 'json'
    .done (data) =>
      console.log data
      @set('body', data.body)
