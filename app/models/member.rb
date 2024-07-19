# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :memberships, dependent: :destroy

  validates :name, :surname, :born_at, :born_in, :citizenship, :address, :postal_code, presence: true

  def status
    %w[ok warning error].sample
  end
end
