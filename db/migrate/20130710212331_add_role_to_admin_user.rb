class AddRoleToAdminUser < ActiveRecord::Migration
  def up
    add_column :admin_users, :role, :string
    AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => 'admin')
  end

  def down
    remove_column :admin_users, :role, :string
  end
end
