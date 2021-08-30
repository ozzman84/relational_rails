class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :category
      t.integer :days_old
      t.boolean :gluten_free
      t.timestamps
      t.references :bakery, foreign_key: true
    end
  end
end
