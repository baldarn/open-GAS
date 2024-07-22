# frozen_string_literal: true

class AddGroup < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
