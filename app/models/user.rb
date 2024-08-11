# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  has_one_attached :picture

  enum :role, %i[admin collaborator]

  belongs_to :club

  validates :first_name, :last_name, :password, presence: true
end
