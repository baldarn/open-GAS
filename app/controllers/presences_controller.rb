# frozen_string_literal: true

class PresencesController < BaseController
  before_action :set_event

  def index
    @presences = @event.presences
  end

  def create
    @presence = @event.presences.find_or_initialize_by(presence_params)

    if params[:is_present] && @presence.new_record?
      @presence.save
    else
      @presence.destroy
    end
  end

  private

  def presence_params
    params.permit(:date, :member_id, :presence)
  end

  def set_event
    @event = @club.events.find(params[:event_id])
  end
end
