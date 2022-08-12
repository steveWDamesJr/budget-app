class Group < ApplicationRecord
  has_many :purchasegroups, dependent: :destroy
  has_many :purchases, through: :purchasegroups, dependent: :destroy

  validates :name, presence: true, length: { in: 3..15 }
  validates :icon, presence: true

  def self.total_purchased(group_id)
    sum = 0
    purchase_groups = PurchaseGroup.all
    purchase_groups.each do |purchase_group|
      next unless purchase_group.group_id == group_id.to_i

      purchases = Purchase.where(id: purchase_group.purchase_id)
      purchases.each do |purchase|
        sum += purchase.amount.to_i
      end
    end
    sum
  end
end
