# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to club_dashboard_url(current_user.club)
  end
end
