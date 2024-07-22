# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :member_groups, dependent: :destroy
  has_many :members, through: :member_groups, dependent: :nullify

  validates :name, presence: true
end
