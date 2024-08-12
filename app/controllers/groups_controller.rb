# frozen_string_literal: true

class GroupsController < BaseController
  def index
    @groups = @club.groups.page(params[:page])
  end

  def new
    @group = @club.groups.build
  end

  def edit
    @group = @club.groups.find(params[:id])
  end

  def create
    @group = @club.groups.build(group_params)

    if @group.save
      respond_to do |format|
        format.html { redirect_to club_groups_url(@club), flash: { notice: I18n.t('groups.created') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('groups.created') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def update
    @group = @club.groups.find(params[:id])

    if @group.update(group_params)
      respond_to do |format|
        format.html { redirect_to club_groups_url(@club), flash: { notice: I18n.t('groups.updated') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('groups.updated') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def destroy
    @group = @club.groups.find(params[:id])
    @group.destroy

    redirect_to club_groups_url(@club), flash: { success: I18n.t('groups.destroyed') }
  end

  private

  def group_params
    params.require(:group).permit(:name, :default_amount)
  end
end
