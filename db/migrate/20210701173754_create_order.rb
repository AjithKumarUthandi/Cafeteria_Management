class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.datetime :created_at
      t.datetime  :delivered_at
      t.datetime :archive_at
    end
  end
end
