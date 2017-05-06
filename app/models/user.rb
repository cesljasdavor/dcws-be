class User < ApplicationRecord
  has_many :purchases
  has_many :products, through: :purchases
  has_many :receipts, through: :purchases
  has_many :ratings
  # query ako hoćeš vidjeti admina

  EMAIL_REGEX = /\A([a-zA-Z\d]+[\._-]*[a-zA-Z\d]+)+@[a-zA-Z]{3,}\.[a-zA-Z]{2,6}\z/i
  validates :email, format: { with: EMAIL_REGEX}
  validates :email, uniqueness: true
  validates :email, presence: true

  # netreba ti jer to unosi aplikacija(i takav mail već mora proći prvu validaciju)
  # validates :email_admin, format: {with: EMAIL_REGEX}

  validates :name, presence: true

  validates :surname, presence: true

  validates :password, presence: true

  validates :address, presence: true

  validates :date_of_birth, presence: true

  validates :privilege, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 2} # to su jedine moguće privilegije

end
