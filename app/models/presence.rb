# frozen_string_literal: true

class Presence < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :group, optional: true
  belongs_to :member

  validates :date, presence: true
end
