# frozen_string_literal: true

class AddAddressColumnsToClub < ActiveRecord::Migration[7.2]
  def change
    add_column :clubs, :address, :string, null: false
    add_column :clubs, :postal_code, :string, null: false
    add_column :clubs, :municipality, :string, null: false
    add_column :clubs, :province, :string, null: false
    add_column :clubs, :telephone, :string
  end
end
