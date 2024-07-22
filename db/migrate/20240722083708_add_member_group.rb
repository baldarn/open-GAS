# frozen_string_literal: true

class AddMemberGroup < ActiveRecord::Migration[7.1]
  def change
    create_table :member_groups do |t|
      t.belongs_to :member
      t.belongs_to :group

      t.timestamps
    end
  end
end
