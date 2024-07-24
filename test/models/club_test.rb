# frozen_string_literal: true

require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  test 'valudates presence' do
    club = Club.create

    assert(club.errors.key?('name'))
  end
end
