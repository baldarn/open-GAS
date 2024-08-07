# frozen_string_literal: true

class Club < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_one_attached :picture

  belongs_to :user

  has_many :members, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :payments, through: :members

  validates :name, presence: true
end
