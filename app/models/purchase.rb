class Purchase < ApplicationRecord
  has_many :purchasegroups, dependent: :destroy
  has_many :groups, through: :purchasegroups

  validates :name, presence: true 
  validates :amount, presence: :true
end
