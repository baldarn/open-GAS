# frozen_string_literal: true

class CreateMember < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.date :born_at, null: false
      t.string :born_in, null: false
      t.string :tax_code
      t.string :citizenship, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :province
      t.string :telephone
      t.string :email

      t.text :notes

      t.timestamps
    end
  end
end
