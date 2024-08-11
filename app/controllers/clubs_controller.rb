# frozen_string_literal: true

class ClubsController < ApplicationController
  def edit
    @club = current_user.club
  end

  def update
    @club = current_user.club

    if @club.update(club_params)
      respond_to do |format|
        format.html { redirect_to edit_club_url(@club), flash: { notice: I18n.t('club.updated') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('club.updated') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :email)
  end
end
