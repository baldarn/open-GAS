# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :payment_reason

  validates :amount, presence: true

  def in_eur
    "#{(amount / 100.0).round(2)} €"
  end
end
