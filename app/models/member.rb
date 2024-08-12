# frozen_string_literal: true

class Member < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_one_attached :picture

  belongs_to :club

  has_many :payments, dependent: :destroy

  has_many :member_groups, dependent: :destroy
  has_many :groups, through: :member_groups, dependent: :nullify

  has_many :member_tags, dependent: :destroy
  has_many :tags, through: :member_tags, dependent: :nullify

  validates :first_name,
            :last_name,
            :born_at,
            :born_in,
            :citizenship,
            :address,
            :postal_code,
            :email,
            :municipality, presence: true

  validates :groups, length: { minimum: 1 }

  scope :with_expiring_medical_certificate,
        -> { where(medical_certificate_expires_at: Time.zone.today.beginning_of_day..2.months.from_now) }

  # TODO: model validation of medical certificate if exists
  enum :medical_certificate_kind, %i[regular competitive]

  scope :with_warnings,
        -> { includes(:payments).select { |m| m.status == 'warning' } }

  scope :with_errors,
        -> { includes(:payments).select { |m| m.status == 'error' } }

  def full_name
    "#{last_name} #{first_name}".capitalize
  end

  def status
    return 'error' if statuses.find { |s| s == 'error' }
    return 'warning' if statuses.find { |s| s == 'warning' }

    'ok'
  end

  def statuses
    [membership_status, medical_status, payments_status]
  end

  def membership_status
    return 'error' if membership_expires_at.blank? || membership_expires_at <= 1.month.ago
    return 'warning' if membership_expires_at <= Time.zone.now

    'ok'
  end

  def medical_status
    return 'error' if medical_certificate_expires_at.blank? || medical_certificate_expires_at <= Time.zone.now
    return 'warning' if medical_certificate_expires_at <= 2.months.from_now

    'ok'
  end

  def payments_status
    last_payment = payments.last

    return 'error' if last_payment.blank?

    # TODO: logic

    'ok'
  end
end
