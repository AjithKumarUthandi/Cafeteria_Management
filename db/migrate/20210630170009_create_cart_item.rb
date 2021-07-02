class CreateCartItem < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.string :menu_item_name
      t.integer :menu_item_quantity, :default =>  1
      t.references :user, null: false, foreign_key: true
    end
  end
end
