# frozen_string_literal: true

class Member < ApplicationRecord
  has_one_attached :picture

  has_many :payments, dependent: :destroy
  has_many :memberships, dependent: :destroy

  has_many :member_groups, dependent: :destroy
  has_many :groups, through: :member_groups, dependent: :nullify

  validates :first_name,
            :last_name,
            :born_at,
            :born_in,
            :citizenship,
            :address,
            :postal_code,
            :municipality, presence: true

  # TODO: validity of medical certificate if exists
  enum :medical_certificate_kind, %i[regular competitive]

  def status
    return 'error' if statuses.find { |s| s == 'error' }
    return 'warning' if statuses.find { |s| s == 'warning' }

    'ok'
  end

  def statuses
    [membership_status, medical_status, payments_status]
  end

  def membership_status
    last_membership = memberships.last

    return 'error' if last_membership.blank?

    # TODO: logic

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
