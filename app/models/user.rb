# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_one_attached :picture

  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups, dependent: :nullify

  enum :role, %i[admin collaborator]

  belongs_to :club, optional: true

  validates :first_name, :last_name, presence: true

  scope :with_expiring_blsd,
        -> { where(blsd_expires_at: Time.zone.today.beginning_of_day..6.months.from_now) }

  def admin?
    role == 'admin'
  end
end
