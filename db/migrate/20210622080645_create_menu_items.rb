class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.references :menu_category, null: false, foreign_key: true
      t.string :item_name
      t.string :description
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
