class MdNote.Views.LayoutView extends Backbone.View
  viewContainer: '#main'
  currentView: null

  setView: (view) ->
    @currentView.remove() if @currentView
    @currentView = view
    @$(@viewContainer).html view.render().el
