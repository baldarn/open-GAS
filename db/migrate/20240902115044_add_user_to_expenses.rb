# frozen_string_literal: true

class AddUserToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_belongs_to :expenses, :user
  end
end
