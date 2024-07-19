# frozen_string_literal: true

require 'test_helper'

class MedicalCertificateTest < ActiveSupport::TestCase
  test 'valudates presence' do
    mc = MedicalCertificate.create

    assert(mc.errors.key?('kind'))
    assert(mc.errors.key?('certificate'))
    assert(mc.errors.key?('expires_at'))
  end
end
