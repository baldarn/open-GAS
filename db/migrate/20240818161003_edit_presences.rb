# frozen_string_literal: true

class EditPresences < ActiveRecord::Migration[7.2]
  def change
    add_belongs_to :presences, :group
  end
end
