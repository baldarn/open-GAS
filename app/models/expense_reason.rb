# frozen_string_literal: true

class ExpenseReason < ApplicationRecord
  belongs_to :club

  validates :reason, presence: true
end
