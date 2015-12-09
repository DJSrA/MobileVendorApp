class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
