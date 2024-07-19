# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @members = Member.all
  end
end
