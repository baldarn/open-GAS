# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.belongs_to :member
      t.belongs_to :payment_reason

      t.integer :amount, null: false

      t.timestamps
    end
  end
end
