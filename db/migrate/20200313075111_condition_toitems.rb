class ConditionToitems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :string
  end
end
