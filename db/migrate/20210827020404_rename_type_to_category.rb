class RenameTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :goods, :type, :category
  end
end
