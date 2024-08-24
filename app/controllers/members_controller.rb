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
            :first_parent_first_name,
            :first_parent_last_name,
            :first_parent_born_at,
            :first_parent_born_in,
            :first_parent_tax_code,
            :first_parent_citizenship,
            :first_parent_address,
            :first_parent_postal_code,
            :first_parent_municipality,
            :first_parent_province,
            :first_parent_telephone,
            :first_parent_email,
            :second_parent_first_name,
            :second_parent_last_name,
            :second_parent_born_at,
            :second_parent_born_in,
            :second_parent_tax_code,
            :second_parent_citizenship,
            :second_parent_address,
            :second_parent_postal_code,
            :second_parent_municipality,
            :second_parent_province,
            :second_parent_telephone,
            :second_parent_email,
            group_ids: [],
            tag_ids: []
          )
  end
end
