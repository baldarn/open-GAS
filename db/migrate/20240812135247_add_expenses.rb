# frozen_string_literal: true

class AddExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.belongs_to :club
      t.belongs_to :expense_reason

      t.integer :amount, null: false

      t.timestamps
    end
  end
end
