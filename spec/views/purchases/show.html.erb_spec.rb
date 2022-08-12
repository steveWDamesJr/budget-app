require 'rails_helper'

RSpec.describe 'purchases/show', type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
                                    name: 'Name',
                                    amount: ''
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
