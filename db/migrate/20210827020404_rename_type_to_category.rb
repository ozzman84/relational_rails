class RenameCategoryToGoodCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :goods, :category, :category
  end
end
