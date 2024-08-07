# frozen_string_literal: true

class MembersController < BaseController
  def index
    @group = params[:group_id] ? @club.groups.find(params[:group_id]) : @club.groups.first
    @members = @group.members.order(:last_name)
  end

  def new
    @member = @club.members.build
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
            group_ids: []
          )
  end
end
