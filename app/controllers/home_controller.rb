# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @club = Club.first
  end
end
