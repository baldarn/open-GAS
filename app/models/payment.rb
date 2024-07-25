# frozen_string_literal: true

class Payment < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :member

  validates :amount, :reason, presence: true
end
