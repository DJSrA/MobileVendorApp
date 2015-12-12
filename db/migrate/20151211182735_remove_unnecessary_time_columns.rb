class RemoveUnnecessaryTimeColumns < ActiveRecord::Migration
  def change
    remove_column :vendors, :date_closed
    remove_column :vendors, :shop_open
    remove_column :vendors, :shop_closed
  end
end
