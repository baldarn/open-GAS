# frozen_string_literal: true

class MembersController < ApplicationController
  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

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
            :medical_certificate_expires_at
          )
  end
end
