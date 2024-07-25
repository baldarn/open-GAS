# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.belongs_to :member
      t.integer :amount, null: false
      t.string :reason, null: false

      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
