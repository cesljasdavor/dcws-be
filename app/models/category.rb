class Category < ApplicationRecord
  has_many :product_categories, dependent: :delete_all
  has_many :products, through: :product_categories
  # query ako hoćeš pronaći nadređene kategorije

  validates :name, uniqueness: true
  validates :name, presence: true

  validates :description, presence: true

end
