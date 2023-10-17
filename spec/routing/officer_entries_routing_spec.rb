require 'rails_helper'

RSpec.describe OfficerEntriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/officer_entries').to route_to('officer_entries#index')
    end

    it 'routes to #new' do
      expect(get: '/officer_entries/new').to route_to('officer_entries#new')
    end

    it 'routes to #show' do
      expect(get: '/officer_entries/1').to route_to('officer_entries#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/officer_entries/1/edit').to route_to('officer_entries#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/officer_entries').to route_to('officer_entries#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/officer_entries/1').to route_to('officer_entries#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/officer_entries/1').to route_to('officer_entries#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/officer_entries/1').to route_to('officer_entries#destroy', id: '1')
    end
  end
end
