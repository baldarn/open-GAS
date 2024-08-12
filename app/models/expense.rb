# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :club
  belongs_to :expense_reason

  validates :amount, presence: true
end
