# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :member

      t.timestamps
    end
  end
end
