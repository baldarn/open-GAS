# frozen_string_literal: true

class CreateMember < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.belongs_to :club

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :born_at, null: false
      t.string :born_in, null: false
      t.string :tax_code
      t.string :citizenship, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :municipality, null: false
      t.string :province, null: false
      t.string :telephone
      t.string :email

      t.integer :medical_certificate_kind
      t.date :medical_certificate_expires_at

      t.string :membership_id
      t.date :membership_expires_at

      t.text :notes

      t.boolean :privacy_disclaimer, null: false, default: false
      t.boolean :picture_disclaimer, null: false, default: false

      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
