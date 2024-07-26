# frozen_string_literal: true

class Presence < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validates :date, presence: true
end
