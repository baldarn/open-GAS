# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :payment_reason

  validates :amount, presence: true
end
