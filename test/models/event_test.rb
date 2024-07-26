# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'valudates presence' do
    event = Event.create

    assert(event.errors.key?('kind'))
    assert(event.errors.key?('date_from'))
  end
end
