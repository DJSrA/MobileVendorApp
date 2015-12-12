class AddCorrectOpenCloseToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :shop_open, :datetime
    add_column :vendors, :shop_closed, :datetime
  end
end
