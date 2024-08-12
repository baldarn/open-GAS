# frozen_string_literal: true

class MembersController < BaseController
  def index
    @group = params[:group_id] ? @club.groups.find(params[:group_id]) : nil
    @tag = params[:tag_id] ? @club.tags.find(params[:tag_id]) : nil

    @members = @club.members
    @members = @members.joins(:groups).where(groups: { id: @group.id }) if @group
    @members = @members.joins(:tags).where(tags: { id: @tag.id }) if @tag
    @members = @members.page(params[:page])
  end

  def dashboard
    @group = params[:group_id] ? @club.groups.find(params[:group_id]) : @club.groups.first

    if @group.blank?
      return redirect_to new_club_group_url(@club), flash: { notice: I18n.t('groups.create_a_group_before') }
    end

    @members = @group.members.order(:last_name)
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
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = I18n.t('members.created') }
      end
    else
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def update
    @member = @club.members.find(params[:id])

    if @member.update(member_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = I18n.t('members.updated') }
      end
    else
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def destroy
    @member = @club.members.find(params[:id])
    @member.discard

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
