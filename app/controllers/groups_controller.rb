# frozen_string_literal: true

class GroupsController < BaseController
  before_action :current_user_is_admin?

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
      redirect_to club_groups_url(@club), flash: { notice: I18n.t('groups.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @group = @club.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to club_groups_url(@club), flash: { notice: I18n.t('groups.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = @club.groups.find(params[:id])
    @group.destroy

    redirect_to club_groups_url(@club), flash: { success: I18n.t('groups.destroyed') }
  end

  private

  def group_params
    params.require(:group).permit(:name, :default_amount, :mandatory_medical_certificate)
  end
end
