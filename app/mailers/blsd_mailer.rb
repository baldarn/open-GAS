# frozen_string_literal: true

class BlsdMailer < ApplicationMailer
  def expiring_email
    @user = params[:user]

    mail(to: @user.email, subject: I18n.t('blsd.expiring_email.subject'))
  end
end
