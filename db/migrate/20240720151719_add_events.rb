# frozen_string_literal: true

class AddEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.belongs_to :club

      t.string :title, null: false
      t.integer :kind, null: false
      t.date :date_from, null: false
      t.date :date_to
      t.time :time_from
      t.time :time_to
      t.boolean :all_day, null: false, default: 0

      t.text :description

      t.belongs_to :place

      t.timestamps
    end
  end
end
