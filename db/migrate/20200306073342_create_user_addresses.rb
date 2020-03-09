class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :postcode, null: false
      t.string :address_prefecture, null: false
      t.string :address_city, null: false
      t.string :address_block, null: false
      t.string :address_building
      t.integer :buy_tell, limit: 8
      t.integer :user_id, limit: 8, null: false
      #テスト終わってから、外部キー
      t.timestamps
    end
  end
end
