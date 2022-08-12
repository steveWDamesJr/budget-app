require 'rails_helper'

RSpec.describe 'Test New purchase page', type: :feature do
  describe 'GET new purchase page' do
    before(:each) do
      visit user_session_path
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
        select 'Food', from: 'icon'
        fill_in 'Name', with: 'Rice'

        click_button 'Add Purchase Type'

        click_button 'Rice'

        expect(page).to have_link('Add new purchase')
      end
    end
    it 'can add a new purchase' do
      visit new_user_group_path(:user_id) do
        select 'Food', from: 'icon'
        fill_in 'Name', with: 'Rice'

        click_button 'Add Purchase Type'

        click_button 'Rice'

        click_button 'Add new purchase'

        fill_in 'Purchase 1'

        fill_in '20.00'

        click_button 'Add Purchase'

        expect(page).to have_content('Purchase was successfully created.')
      end
    end
  end
end
