# frozen_string_literal: true

class AddPresences < ActiveRecord::Migration[7.1]
  def change
    create_table :presences do |t|
      t.belongs_to :member
      t.belongs_to :training

      t.timestamps
    end
  end
end
