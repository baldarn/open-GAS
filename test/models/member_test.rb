# frozen_string_literal: true

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test 'valudates presence' do
    member = Member.create

    assert(member.errors.key?('club'))
    assert(member.errors.key?('first_name'))
    assert(member.errors.key?('last_name'))
    assert(member.errors.key?('born_at'))
    assert(member.errors.key?('born_in'))
    assert(member.errors.key?('citizenship'))
    assert(member.errors.key?('address'))
    assert(member.errors.key?('postal_code'))
  end

  test 'has at least a parent if minor' do
    assert_not(members(:minor_with_no_parents).valid?)

    assert(members(:minor_with_first_parent).valid?)
  end
end
