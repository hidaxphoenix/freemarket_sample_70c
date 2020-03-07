class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :address_prefecture, :address_city, :address_block, :address_building, presence: true
end
