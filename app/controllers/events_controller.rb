# frozen_string_literal: true

class EventsController < BaseController
  def index
    start_date = params.fetch(:start_date, Time.zone.today).to_date

    @events = @club.events.where(
      date_from: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
    )
  end

  def new
    @event = @club.events.build
  end

  def edit
    @event = @club.events.find(params[:id])
  end

  def create
    @event = @club.events.build(event_params)

    if @event.save
      redirect_to club_events_url(@club), flash: { notice: I18n.t('events.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @event = @club.events.find(params[:id])

    if @event.update(event_params)
      redirect_to club_events_url(@club), flash: { notice: I18n.t('events.updated') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = @club.events.find(params[:id])
    @event.destroy

    redirect_to club_events_url(@club), flash: { success: I18n.t('events.destroyed') }
  end

  private

  def event_params
    params.require(:event)
          .permit(
            :kind,
            :title,
            :date_from,
            :date_to,
            :time_from,
            :time_to,
            :all_day,
            group_ids: []
          )
  end
end
