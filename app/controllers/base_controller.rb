# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :set_club

  def set_club
    @club = current_user.club
  end
end
