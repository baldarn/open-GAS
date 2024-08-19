# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :club

  has_many :member_groups, dependent: :destroy
  has_many :members, through: :member_groups, dependent: :nullify
  has_many :presences, dependent: :nullify

  validates :name, presence: true

  def member_present_at_date?(member, date)
    presences.where(member:, date:).present?
  end
end
