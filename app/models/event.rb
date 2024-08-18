# frozen_string_literal: true

class Event < ApplicationRecord
  has_one_attached :attachment

  belongs_to :club

  has_many :presences, dependent: :destroy
  has_many :members, through: :presences

  has_many :event_groups, dependent: :destroy
  has_many :groups, through: :event_groups

  enum :kind, %i[training competition other]

  validates :title, :kind, :date_from, presence: true

  # for simple-calendar
  def start_time
    date_from
  end

  def member_present_at_date?(member, date)
    presences.where(member:, date:).count == 1
  end
end
