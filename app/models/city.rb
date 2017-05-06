class City < ApplicationRecord

  # zato što gledamo pošte
  validates :city, uniqueness: true
  validates :city, presence: true

end
