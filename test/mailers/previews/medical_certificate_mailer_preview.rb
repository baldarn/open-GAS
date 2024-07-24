# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/medical_certificate_mailer
class MedicalCertificateMailerPreview < ActionMailer::Preview
  def expiring_email
    MedicalCertificateMailer.with(member: Member.first).expiring_email
  end
end
