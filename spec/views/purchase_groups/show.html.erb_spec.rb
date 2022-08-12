require 'rails_helper'

RSpec.describe 'purchase_groups/show', type: :view do
  before(:each) do
    @purchase_group = assign(:purchase_group, PurchaseGroup.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
