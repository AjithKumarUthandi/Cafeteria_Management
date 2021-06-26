class CreateAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :door_no
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
    end
  end
end
