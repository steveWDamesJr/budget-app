require 'rails_helper'

RSpec.describe 'purchases/index', type: :view do
  before(:each) do
    assign(:purchases, [
             Purchase.create!(
               name: 'Name',
               amount: ''
             ),
             Purchase.create!(
               name: 'Name',
               amount: ''
             )
           ])
  end

  it 'renders a list of purchases' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
