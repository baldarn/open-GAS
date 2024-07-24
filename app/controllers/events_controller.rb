# frozen_string_literal: true

class EventsController < BaseController
  def index
    start_date = params.fetch(:start_date, Time.zone.today).to_date

    case params[:view]
    when 'week'
      @events = Event.where(
        date_from: start_date.beginning_of_day..start_date.end_of_day + 1.week
      )

      render 'week'
    when 'day'
      @events = Event.where(
        date_from: start_date.all_day
      )

      render 'day'
    when 'agenda'
      @events = Event.where(
        date_from: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
      )

      render 'agenda'
    else
      # default view is month
      @events = Event.where(
        date_from: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
      )
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('events.created') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:kind, :date_from, :date_to)
  end
end
