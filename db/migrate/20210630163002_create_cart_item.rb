class CreateCartItem < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :card, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true
      t.string :menu_item_name
      t.integer :menu_item_quantity

      t.timestamps
    end
  end
end
