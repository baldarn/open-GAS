# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'validates presence' do
    event = Event.create

    assert(event.errors.key?('title'))
    assert(event.errors.key?('kind'))
    assert(event.errors.key?('date_from'))
  end
end
