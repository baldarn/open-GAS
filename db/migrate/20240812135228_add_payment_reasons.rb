# frozen_string_literal: true

class AddPaymentReasons < ActiveRecord::Migration[7.2]
  def change
    create_table :payment_reasons do |t|
      t.belongs_to :club

      t.string :reason, null: false

      t.timestamps
    end
  end
end
