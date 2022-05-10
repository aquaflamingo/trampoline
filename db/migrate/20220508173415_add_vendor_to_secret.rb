# frozen_string_literal: true

class AddVendorToSecret < ActiveRecord::Migration[7.0]
  def change
    add_column :secrets, :vendor, :string
  end
end
