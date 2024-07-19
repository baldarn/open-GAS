# frozen_string_literal: true

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test 'valudates presence' do
    payment = Payment.create

    assert(payment.errors.key?('member'))
    assert(payment.errors.key?('amount'))
  end
end
