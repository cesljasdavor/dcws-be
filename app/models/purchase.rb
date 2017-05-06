class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :receipt

  validates :product_id, presence: true

  validates :user_id, presence: true

  validates :receipt_id, presence: true

  validates :amount, presence: true
  validates :amount, numericality: {greater_than: 0}

end
