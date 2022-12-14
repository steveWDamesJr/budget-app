class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { in: 3..15 }
  validates :email, presence: true
end
