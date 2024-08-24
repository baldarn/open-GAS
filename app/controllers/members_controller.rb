# frozen_string_literal: true

class MembersController < BaseController
  before_action :current_user_is_admin?

  def index
    @group = params[:group_id] ? @club.groups.find(params[:group_id]) : nil
    @tag = params[:tag_id] ? @club.tags.find(params[:tag_id]) : nil

    @members = @club.members
    @members = @members.joins(:groups).where(groups: { id: @group.id }) if @group
    @members = @members.joins(:tags).where(tags: { id: @tag.id }) if @tag
    @members = @members.page(params[:page])
  end

  def new
    @member = @club.members.build
  end

  def edit
    @member = @club.members.find(params[:id])
  end

  def create
    @member = @club.members.build(member_params)

    if @member.save
      redirect_to club_members_url(@club), flash: { notice: I18n.t('members.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @member = @club.members.find(params[:id])

    if @member.update(member_params)
      redirect_to club_members_url(@club), flash: { notice: I18n.t('members.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @member = @club.members.find(params[:id])
    @member.destroy

    redirect_to club_members_url(@club), flash: { success: I18n.t('members.destroyed') }
  end

  private

  def member_params
    params.require(:member)
          .permit(
            :first_name,
            :last_name,
            :born_at,
            :born_in,
            :tax_code,
            :citizenship,
            :address,
            :postal_code,
            :municipality,
            :province,
            :telephone,
            :email,
            :picture,
            :medical_certificate_kind,
            :medical_certificate_expires_at,
            :membership_id,
            :membership_expires_at,
            :privacy_disclaimer,
            :picture_disclaimer,
            group_ids: [],
            tag_ids: []
          )
  end
end
