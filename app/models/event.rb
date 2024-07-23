# frozen_string_literal: true

class Event < ApplicationRecord
  has_one_attached :attachment

  belongs_to :place, optional: true

  enum :kind, %i[training competition other]

  validates :kind, :date_from, :date_to, presence: true

  serialize :recurring, coder: YAML, type: Hash

  def recurring=(value)
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  # for simple-calendar
  def start_time
    date_from
  end
end
