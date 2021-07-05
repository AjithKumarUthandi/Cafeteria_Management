class CreateMenuCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories do |t|
      t.string :menu_name
      t.time :available_time_begin
      t.time :available_time_end
      t.boolean :active
      t.datetime :archive_at

      t.timestamps
    end
  end
end
