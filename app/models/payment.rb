# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :payment_reason

  validates :amount, :number, :kind, presence: true
  validates :number, uniqueness: { conditions: -> { of_year(Time.current.year) } }

  enum :kind, %i[cash bank other]

  scope :of_year, ->(year) { where(created_at: "#{year}-01-01".to_date.all_year) }

  def in_eur
    "#{(amount / 100.0).round(2)} €"
  end
end
