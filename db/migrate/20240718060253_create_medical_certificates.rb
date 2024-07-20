# frozen_string_literal: true

class CreateMedicalCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_certificates do |t|
      t.integer :kind, null: false
      t.date :expires_at, null: false

      t.timestamps
    end
  end
end
