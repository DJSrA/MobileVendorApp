class AddApprovalBooleanToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :approved, :boolean, default: false
  end
end
