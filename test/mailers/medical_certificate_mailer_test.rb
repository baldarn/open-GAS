# frozen_string_literal: true

require 'test_helper'

class MedicalCertificateMailerTest < ActionMailer::TestCase
  test 'expiring_email' do
    member = members(:adult)
    email = MedicalCertificateMailer.with(member:).expiring_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['info@opengas.eu'], email.from
    assert_equal [member.email], email.to
  end
end
