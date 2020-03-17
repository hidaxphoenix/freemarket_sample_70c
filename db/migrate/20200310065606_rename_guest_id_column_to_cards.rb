class RenameGuestIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :guest_id, :customer_id
  end
end
