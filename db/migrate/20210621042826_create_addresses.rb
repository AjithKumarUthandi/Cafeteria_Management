class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :door_no
      t.string :address
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
