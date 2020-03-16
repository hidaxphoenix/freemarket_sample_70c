class AddSalerIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :saler_id, :bigint
  end
end
