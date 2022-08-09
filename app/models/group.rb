class Group < ApplicationRecord
  has_many :purchasegroups, dependent: :destroy
  has_many :purchases, through: :purchasegroups, dependent: :destroy
end
