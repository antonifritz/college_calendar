class AddDefaultValueToIsAdminInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :is_admin, :boolean, default: false
  end
  
  def down
    change_column :users, :is_admin, :boolean, default: nil
  end
end