# frozen_string_literal: true

class AddExpenseReasons < ActiveRecord::Migration[7.2]
  def change
    create_table :expense_reasons do |t|
      t.belongs_to :club

      t.string :reason, null: false

      t.timestamps
    end
  end
end
