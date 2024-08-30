# frozen_string_literal: true

class AddParentsToMembers < ActiveRecord::Migration[7.2]
  def change
    change_table :members, bulk: true do |t|
      # first parent
      t.string :first_parent_first_name
      t.string :first_parent_last_name
      t.date :first_parent_born_at
      t.string :first_parent_born_in
      t.string :first_parent_tax_code
      t.string :first_parent_citizenship
      t.string :first_parent_address
      t.string :first_parent_postal_code
      t.string :first_parent_municipality
      t.string :first_parent_province
      t.string :first_parent_telephone
      t.string :first_parent_email

      # second parent
      t.string :second_parent_first_name
      t.string :second_parent_last_name
      t.date :second_parent_born_at
      t.string :second_parent_born_in
      t.string :second_parent_tax_code
      t.string :second_parent_citizenship
      t.string :second_parent_address
      t.string :second_parent_postal_code
      t.string :second_parent_municipality
      t.string :second_parent_province
      t.string :second_parent_telephone
      t.string :second_parent_email
    end
  end
end
