# frozen_string_literal: true

class AddEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.integer :kind, null: false
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.text :description

      t.text :recurring

      t.belongs_to :place

      t.timestamps
    end
  end
end
