# frozen_string_literal: true

class AddGroup < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.belongs_to :club

      t.string :name, null: false
      t.integer :default_amount

      t.timestamps
    end
  end
end
