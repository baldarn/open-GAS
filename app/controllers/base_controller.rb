# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :set_club

  def set_club
    @club = Club.find(params[:club_id])
  end
end
