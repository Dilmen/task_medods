class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.date :birthday
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
