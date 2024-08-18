# frozen_string_literal: true

class MedicalCertificateReminderJob < ApplicationJob
  @queue = :default

  def perform
    members = Member.with_expiring_medical_certificate
    members.each do |member|
      MedicalCertificateMailer.with(member:).expiring_email.deliver_later
    end
  end
end
