# frozen_string_literal: true

class ClubsController < BaseController
  before_action :current_user_is_admin?
  before_action -> { resize_image(club_params[:picture], 300, 300) }, only: [:update]

  def edit
    @club = current_user.club
  end

  def update
    @club = current_user.club

    if @club.update(club_params)
      redirect_to edit_club_url(@club), flash: { notice: I18n.t('clubs.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :email, :address, :postal_code, :province, :tax_code, :telephone, :picture)
  end
end
