# frozen_string_literal: true

class MedicalCertificateMailer < ApplicationMailer
  def expiring_email
    @member = params[:member]

    mail(to: @member.email, subject: I18n.t('medical_certificate.expiring_email.subject'))
  end
end
