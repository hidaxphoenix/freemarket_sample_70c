class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name,     null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
