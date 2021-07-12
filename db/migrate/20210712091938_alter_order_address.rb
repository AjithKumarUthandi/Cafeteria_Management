class AlterOrderAddress < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :address_id, :bigint, :null => true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
