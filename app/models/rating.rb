class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true

  validates :product_id, presence: true

  validates :grade, presence: true
  validates :grade, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
