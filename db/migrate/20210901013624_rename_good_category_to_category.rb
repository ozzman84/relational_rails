class RenameGoodCategoryToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :goods, :good_category, :category
  end
end
