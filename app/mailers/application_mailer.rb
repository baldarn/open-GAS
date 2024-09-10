# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@opengas.eu'
  layout 'mailer'
end
