# frozen_string_literal: true

class RemovePlaces < ActiveRecord::Migration[7.2]
  def change
    drop_table :places do |t|
      t.string :name, null: false

      t.timestamps
    end

    remove_column :events, :place_id, :integer
  end
end
