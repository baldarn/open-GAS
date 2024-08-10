# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :club

  has_many :member_tags, dependent: :destroy
  has_many :members, through: :member_tags, dependent: :nullify

  validates :name, presence: true
end
