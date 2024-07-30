# frozen_string_literal: true

class GroupsController < BaseController
  def index
    @groups = @club.groups
  end

  def new
    @group = @club.groups.build
  end

  def create
    @group = @club.groups.build(group_params)

    if @group.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @group = @club.members.find(params[:id])

    if @group.update(group_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
