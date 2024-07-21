# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = []
  end

  def new
    @event = Event.new
  end
end
