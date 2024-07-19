# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.belongs_to :member
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
