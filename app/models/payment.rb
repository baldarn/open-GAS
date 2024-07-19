# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :member

  validates :amount, presence: true
end
