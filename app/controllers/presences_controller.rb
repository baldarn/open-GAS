# frozen_string_literal: true

class PresencesController < BaseController
  before_action :set_group

  def index
    @presences = @group.presences
  end

  def create
    @presence = @group.presences.find_or_initialize_by(presence_params)

    if params[:is_present] && @presence.new_record?
      @presence.save
    else
      @presence.destroy
    end
  end

  private

  def presence_params
    params.permit(:date, :member_id, :group_id, :event_id, :presence)
  end

  def set_group
    @group = @club.groups.find(params[:group_id])
  end
end
