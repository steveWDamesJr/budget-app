require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Review Tester', email: 'tester@mail.com', password: 'password')
  end

  before(:each) { subject.save }

  it 'Purchase total is correct' do
    purchase_type = Group.create!(name: 'Kawasaki', icon: 'Motorcycle.png', user_id: subject.id)
    first_purchase = Purchase.create!(name: 'Suzuki', amount: 2000.00, user_id: subject.id)
    PurchaseGroup.create!(purchase_id: first_purchase.id, group_id: purchase_type.id)

    value = Group.total_purchased(purchase_type.id)

    expect(value).to eq(2000.00)
  end
end
