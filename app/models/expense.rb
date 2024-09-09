# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :club
  belongs_to :user, optional: true
  belongs_to :expense_reason

  validates :amount, presence: true

  def in_eur
    "#{(amount / 100.0).round(2)} €"
  end
end
