class AddDateOpenToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :date_open, :date
  end
end
