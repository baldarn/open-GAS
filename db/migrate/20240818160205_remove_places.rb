# frozen_string_literal: true

class RemovePlaces < ActiveRecord::Migration[7.2]
  def change
    drop_table :places

    remove_column :events, :place_id
  end
end
