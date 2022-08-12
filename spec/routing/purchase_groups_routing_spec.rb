require 'rails_helper'

RSpec.describe PurchaseGroupsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/purchase_groups').to route_to('purchase_groups#index')
    end

    it 'routes to #new' do
      expect(get: '/purchase_groups/new').to route_to('purchase_groups#new')
    end

    it 'routes to #show' do
      expect(get: '/purchase_groups/1').to route_to('purchase_groups#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/purchase_groups/1/edit').to route_to('purchase_groups#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/purchase_groups').to route_to('purchase_groups#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/purchase_groups/1').to route_to('purchase_groups#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/purchase_groups/1').to route_to('purchase_groups#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/purchase_groups/1').to route_to('purchase_groups#destroy', id: '1')
    end
  end
end
