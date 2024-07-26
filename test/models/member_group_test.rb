# frozen_string_literal: true

require 'test_helper'

class MemberGroupTest < ActiveSupport::TestCase
  test 'valudates presence' do
    mb = MemberGroup.create

    assert(mb.errors.key?('member'))
    assert(mb.errors.key?('group'))
  end
end
