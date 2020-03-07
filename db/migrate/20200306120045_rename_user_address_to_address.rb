class RenameUserAddressToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_addresses, :addresses
  end
end
