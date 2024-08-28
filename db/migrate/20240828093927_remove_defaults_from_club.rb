# frozen_string_literal: true

class RemoveDefaultsFromClub < ActiveRecord::Migration[7.2]
  def change
    change_table :clubs, bulk: true do |t|
      t.change_default :address, from: 'DA IMPOSTARE', to: nil
      t.change_default :postal_code, from: 'DA IMPOSTARE', to: nil
      t.change_default :municipality, from: 'DA IMPOSTARE', to: nil
      t.change_default :province, from: 'DA IMPOSTARE', to: nil
      t.change_default :tax_code, from: 'DA IMPOSTARE', to: nil
    end
  end
end
