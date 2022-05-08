class AddVendorToSecret < ActiveRecord::Migration[7.0]
  def change
    add_column :secrets, :vendor, :integer
  end
end
