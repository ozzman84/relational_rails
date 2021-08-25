class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :bed, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :rent
      t.boolean :visiting
      t.timestamps
    end
  end
end
