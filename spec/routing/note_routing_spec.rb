require 'spec_helper'

describe 'route to notes controller' do
  describe  'GET /notes' do
    it do
      expect(get '/notes').to route_to(
        controller: 'notes',
        action: 'index'
      )
    end
  end

  describe  'POST /notes' do
    it do
      expect(post '/notes').to route_to(
        controller: 'notes',
        action: 'create'
      )
    end
  end

  describe  'GET /notes/new' do
    it do
      expect(get '/notes/new').to route_to(
        controller: 'notes',
        action: 'new'
      )
    end
  end

  describe 'GET /notes/:id/edit' do
    it do
      expect(get '/notes/1/edit').to route_to(
        controller: 'notes',
        action: 'edit',
        id: '1'
      )
    end
  end

  describe 'GET /notes/:id' do
    it do
      expect(get '/notes/1').to route_to(
        controller: 'notes',
        action: 'show',
        id: '1'
      )
    end
  end

  describe 'PATCH /notes/:id' do
    it do
      expect(patch '/notes/1').to route_to(
        controller: 'notes',
        action: 'update',
        id: '1'
      )
    end
  end

  describe 'DELETE /notes/:id' do
    it do
      expect(delete '/notes/1').to route_to(
        controller: 'notes',
        action: 'destroy',
        id: '1'
      )
    end
  end

  describe 'POST /notes/rendering' do
    it do
      expect(post '/notes/rendering').to route_to(
        controller: 'notes',
        action: 'rendering'
      )
    end
  end
end
