require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/purchase_groups', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PurchaseGroup. As you add validations to PurchaseGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      PurchaseGroup.create! valid_attributes
      get purchase_groups_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      purchase_group = PurchaseGroup.create! valid_attributes
      get purchase_group_url(purchase_group)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_purchase_group_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      purchase_group = PurchaseGroup.create! valid_attributes
      get edit_purchase_group_url(purchase_group)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PurchaseGroup' do
        expect do
          post purchase_groups_url, params: { purchase_group: valid_attributes }
        end.to change(PurchaseGroup, :count).by(1)
      end

      it 'redirects to the created purchase_group' do
        post purchase_groups_url, params: { purchase_group: valid_attributes }
        expect(response).to redirect_to(purchase_group_url(PurchaseGroup.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new PurchaseGroup' do
        expect do
          post purchase_groups_url, params: { purchase_group: invalid_attributes }
        end.to change(PurchaseGroup, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post purchase_groups_url, params: { purchase_group: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested purchase_group' do
        purchase_group = PurchaseGroup.create! valid_attributes
        patch purchase_group_url(purchase_group), params: { purchase_group: new_attributes }
        purchase_group.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the purchase_group' do
        purchase_group = PurchaseGroup.create! valid_attributes
        patch purchase_group_url(purchase_group), params: { purchase_group: new_attributes }
        purchase_group.reload
        expect(response).to redirect_to(purchase_group_url(purchase_group))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        purchase_group = PurchaseGroup.create! valid_attributes
        patch purchase_group_url(purchase_group), params: { purchase_group: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested purchase_group' do
      purchase_group = PurchaseGroup.create! valid_attributes
      expect do
        delete purchase_group_url(purchase_group)
      end.to change(PurchaseGroup, :count).by(-1)
    end

    it 'redirects to the purchase_groups list' do
      purchase_group = PurchaseGroup.create! valid_attributes
      delete purchase_group_url(purchase_group)
      expect(response).to redirect_to(purchase_groups_url)
    end
  end
end
