class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :address_prefecture, :address_city, :address_block, presence: true
end
