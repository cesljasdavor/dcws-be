class Product < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
  has_many :receipts, through: :purchases
  has_many :ratings, dependent: :delete_all
  has_many :product_categories, dependent: :delete_all
  has_many :categories, through: :product_categories
  # query ako hoćeš pronaći tko prodaje proizvod

  validates :title, presence: true

  validates :description, presence: true

  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}

  # validates :availability, presence: true

  validates :email_seller, presence: true
  EMAIL_REGEX = /\A([a-zA-Z\d]+[\._-]*[a-zA-Z\d]+)+@[a-zA-Z]{3,}\.[a-zA-Z]{2,6}\z/i
  validates :email_seller, format: { with: EMAIL_REGEX}



end
