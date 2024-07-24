# frozen_string_literal: true

class Club < ApplicationRecord
  has_one_attached :picture

  has_many :members, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :name, presence: true
end
