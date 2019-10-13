class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.integer :user_id
      t.integer :reading_value

      t.timestamps
    end
  end
end
