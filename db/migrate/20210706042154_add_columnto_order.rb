class AddColumntoOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ordercancel_at, :datetime
    add_column :orders, :cancel_reason,  :string
  end
end
