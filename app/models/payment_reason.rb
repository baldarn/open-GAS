# frozen_string_literal: true

class PaymentReason < ApplicationRecord
  belongs_to :club

  validates :reason, presence: true
end
