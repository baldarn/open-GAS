# frozen_string_literal: true

class ClubsController < ApplicationController
  def edit
    @club = current_user.club
  end

  def update
    @club = current_user.club

    if @club.update(club_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :email)
  end
end
