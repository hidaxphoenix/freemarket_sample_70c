class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  accepts_nested_attributes_for :address
  has_many :items

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  validates :nickname, :phone, :birthday, presence: true
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }

  def change
    add_index :users, :email, unique: true
  end
end
