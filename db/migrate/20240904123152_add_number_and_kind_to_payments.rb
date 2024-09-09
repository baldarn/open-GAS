# frozen_string_literal: true

class AddNumberAndKindToPayments < ActiveRecord::Migration[7.2]
  def change
    change_table :payments, bulk: true do |t|
      t.integer :number, null: false, default: 0
      t.integer :kind, null: false, default: 0
    end
  end
end
