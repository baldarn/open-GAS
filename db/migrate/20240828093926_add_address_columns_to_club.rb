# frozen_string_literal: true

class AddAddressColumnsToClub < ActiveRecord::Migration[7.2]
  def change
    change_table :clubs, bulk: true do |t|
      t.string :address, null: false, default: 'DA IMPOSTARE'
      t.string :postal_code, null: false, default: 'DA IMPOSTARE'
      t.string :municipality, null: false, default: 'DA IMPOSTARE'
      t.string :province, null: false, default: 'DA IMPOSTARE'
      t.string :tax_code, null: false, default: 'DA IMPOSTARE'
      t.string :telephone
    end
  end
end
