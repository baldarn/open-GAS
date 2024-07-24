# frozen_string_literal: true

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'valudates presence' do
    group = Group.create

    assert(group.errors.key?('club'))
    assert(group.errors.key?('name'))
  end
end
