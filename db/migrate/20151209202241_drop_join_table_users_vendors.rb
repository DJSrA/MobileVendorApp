class DropJoinTableUsersVendors < ActiveRecord::Migration
  def change
    drop_join_table :users, :vendors 
  end
end
