# frozen_string_literal: true

require 'test_helper'

class EventGroupTest < ActiveSupport::TestCase
  test 'valudates presence' do
    eg = EventGroup.create

    assert(eg.errors.key?('event'))
    assert(eg.errors.key?('group'))
  end
end
