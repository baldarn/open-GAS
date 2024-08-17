# frozen_string_literal: true

class AddMandatortMedicalCertificateFieldToGroups < ActiveRecord::Migration[7.2]
  def change
    add_column :groups, :mandatory_medical_certificate, :boolean, null: false, default: false
  end
end
