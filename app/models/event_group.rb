# frozen_string_literal: true

class EventGroup < ApplicationRecord
  belongs_to :event
  belongs_to :group
end
