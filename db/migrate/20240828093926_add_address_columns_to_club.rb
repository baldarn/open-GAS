# frozen_string_literal: true

class AddAddressColumnsToClub < ActiveRecord::Migration[7.2]
  def change
    change_table :clubs, bulk: true do |t|
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :municipality, null: false
      t.string :province, null: false
      t.string :telephone
      t.string :tax_code, null: false
    end
  end
end
