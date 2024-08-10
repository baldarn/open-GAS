# frozen_string_literal: true

class AddMemberTags < ActiveRecord::Migration[7.1]
  def change
    create_table :member_tags do |t|
      t.belongs_to :member
      t.belongs_to :tag

      t.timestamps
    end
  end
end
