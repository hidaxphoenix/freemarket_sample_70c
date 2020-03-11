class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :categories, :name,:string, null: true
    change_column :images, :image,:text, null: true
  end

  def down
    change_column :categories, :name,:string, null: false
    change_column :images, :image,:text, null: false

  end

end
