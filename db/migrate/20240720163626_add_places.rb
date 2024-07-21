# frozen_string_literal: true

class AddPlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
