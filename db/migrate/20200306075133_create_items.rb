class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,        null: false
      t.text :description,   null: false
      t.integer :price,      null: false
      t.string :ship_charge, null: false
      t.string :ship_area,   null: false
      t.string :ship_date,   null: false
      t.string :ship_method, null: false
      t.references :user,    foreign_key: true
      t.timestamps
      t.index :name
    end
  end
end
