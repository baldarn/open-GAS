# frozen_string_literal: true

class MembersController < BaseController
  def index
    @group = params[:group_id] ? @club.groups.find(params[:group_id]) : @club.groups.first
    @members = @group.members
  end

  def new
    @member = @club.members.build
  end

  def create
    @member = @club.payments.build(member_params)

    if @member.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = 'created' }
      end
    else
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = 'error' }
      end
    end
  end

  def update
    @member = @club.members.find(params[:id])

    if @member.update(member_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = 'updated' }
      end
    else
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = 'error' }
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
            :membership_expires_at
          )
  end
end
