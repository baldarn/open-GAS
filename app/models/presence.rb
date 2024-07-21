# frozen_string_literal: true

class Presence < ApplicationRecord
  belongs_to :event
  belongs_to :member
end
