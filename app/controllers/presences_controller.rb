# frozen_string_literal: true

class PresencesController < BaseController
  before_action :set_event

  def index
    @presences = @event.presences
  end

  def create
    @presence = @event.presences.build(presence_params)

    if @presence.save
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('events.created') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @presence = @event.presences.find(params[:id])

    if @presence.update(presence_params)
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('events.created') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def presence_params
    params.require(:presence).permit(:date, member_ids: [])
  end

  def set_event
    @event = @club.events.find(params[:event_id])
  end
end
