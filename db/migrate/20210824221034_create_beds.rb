class CreateBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :beds do |t|
      t.string :name
      t.boolean :occupied
      t.integer :guest_count

      t.timestamps
    end
  end
end
