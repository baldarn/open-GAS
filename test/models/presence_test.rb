# frozen_string_literal: true

require 'test_helper'

class PresenceTest < ActiveSupport::TestCase
  test 'valudates presence' do
    presence = Presence.create

    assert(presence.errors.key?('event'))
    assert(presence.errors.key?('member'))
    assert(presence.errors.key?('date'))
  end
end
