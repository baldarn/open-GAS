# frozen_string_literal: true

class AddTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.belongs_to :club

      t.string :name, null: false

      t.timestamps
    end
  end
end
