# frozen_string_literal: true

class AddUserGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :user_groups do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
  end
end
