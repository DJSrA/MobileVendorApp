class AddDateClosedToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :date_closed, :date
  end
end
