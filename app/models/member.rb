# frozen_string_literal: true

class Member < ApplicationRecord
  has_one_attached :picture

  has_many :payments, dependent: :destroy
  has_many :memberships, dependent: :destroy

  validates :first_name,
            :last_name,
            :born_at,
            :born_in,
            :citizenship,
            :address,
            :postal_code,
            :municipality, presence: true

  def status
    %w[ok warning error].sample
  end
end
