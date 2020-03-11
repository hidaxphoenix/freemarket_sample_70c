class AddCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category, :integer
    add_reference :items, :category, index: true
  end
end
