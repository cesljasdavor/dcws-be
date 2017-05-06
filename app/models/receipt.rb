class Receipt < ApplicationRecord
  has_many :purchases, dependent: :delete_all
  has_many :products, through: :purchases
  has_many :users, through: :purchases

  validates :total, presence: true
  validates :total, numericality: {greater_than: 0}

end
