require 'rails_helper'

RSpec.describe 'purchase_groups/index', type: :view do
  before(:each) do
    assign(:purchase_groups, [
             PurchaseGroup.create!,
             PurchaseGroup.create!
           ])
  end

  it 'renders a list of purchase_groups' do
    render
  end
end
