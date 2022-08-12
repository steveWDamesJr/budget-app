require 'rails_helper'

RSpec.describe 'purchases/edit', type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
                                    name: 'MyString',
                                    amount: ''
                                  ))
  end

  it 'renders the edit purchase form' do
    render

    assert_select 'form[action=?][method=?]', purchase_path(@purchase), 'post' do
      assert_select 'input[name=?]', 'purchase[name]'

      assert_select 'input[name=?]', 'purchase[amount]'
    end
  end
end
