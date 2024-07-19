# frozen_string_literal: true

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  test 'valudates presence' do
    membership = Membership.create

    assert(membership.errors.key?('member'))
  end
end
