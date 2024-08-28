# frozen_string_literal: true

class Club < ApplicationRecord
  has_one_attached :picture
  validates :picture, content_type: ['image/png', 'image/jpeg']

  has_many :users, dependent: :destroy

  alias collaborators users

  has_many :members, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :payments, through: :members
  has_many :payment_reasons, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :expense_reasons, dependent: :destroy

  validates :name, :email, :address, :postal_code, :municipality, :province, :tax_code, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  normalizes :email, with: ->(v) { v.strip.downcase }
  normalizes :province, with: ->(v) { v.upcase }

  # TODO
  def full_name_and_address
    'Jakukai ASDC \
via Fieschi 20A canc. \
Genova (GE) \
segreteria@jakukai.it'
  end
end
