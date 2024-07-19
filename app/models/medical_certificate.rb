# frozen_string_literal: true

class MedicalCertificate < ApplicationRecord
  has_one_attached :certificate

  enum :kind, %i[regular competitive]

  validates :kind, :certificate, :expires_at, presence: true
end
