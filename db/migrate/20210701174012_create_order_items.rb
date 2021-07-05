class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.decimal :menu_item_price
      t.integer :menu_item_quantity
      t.datetime :archive_at

      t.timestamps
    end
  end
end
