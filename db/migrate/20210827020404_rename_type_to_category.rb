class RenameTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :goods, :category, :good_category
  end
end
