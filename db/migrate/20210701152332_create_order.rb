class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamp :created_at
      t.timestamp :delivered_at
    end
  end
end
