# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :redirect_to_root, unless: :user_signed_in?
  before_action :set_club

  def redirect_to_root
    redirect_to root_path
  end

  def set_club
    @club = current_user.club
  end
end
