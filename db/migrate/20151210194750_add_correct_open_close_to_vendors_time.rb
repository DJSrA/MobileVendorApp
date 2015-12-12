class AddCorrectOpenCloseToVendorsTime < ActiveRecord::Migration
  def change
    add_column :vendors, :open_time, :time
    add_column :vendors, :close_time, :time
  end
end
