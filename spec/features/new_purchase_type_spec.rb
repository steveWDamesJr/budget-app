require 'rails_helper'

RSpec.describe 'Test New purchase type page', type: :feature do
  describe 'GET user show page' do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it 'has the link to create a new purchase type' do
      visit user_session_path
      sleep(5)
      expect(page).to have_link('Add Purchase Type')
    end
    it 'can create a new purchase type' do
      visit new_user_group_path(:user_id) do
        select 'Motorcycle', from: 'icon'
        fill_in 'Name', with: 'Kawasaki'

        click_button 'Add Purchase Type'

        expect(page).to have_content('Group was successfully created.')
      end
    end
  end
end
