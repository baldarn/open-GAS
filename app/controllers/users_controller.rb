# frozen_string_literal: true

class UsersController < BaseController
  before_action :current_user_is_admin?
  before_action -> { resize_image(user_params[:picture], 250, 200) }, only: %i[create update]

  def index
    @users = @club.users.page(params[:page])
  end

  def new
    @user = @club.users.build
  end

  def edit
    @user = @club.users.find(params[:id])
  end

  def create
    @user = @club.users.build(user_params)
    @user.role = :collaborator
    @user.password = 'password'

    if @user.save
      redirect_to new_club_user_url(@club), flash: { notice: I18n.t('users.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = @club.users.find(params[:id])

    if @user.update(user_params)
      redirect_to club_users_url(@club), flash: { notice: I18n.t('users.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = @club.users.find(params[:id])
    @user.destroy

    redirect_to club_users_url(@club), flash: { success: I18n.t('users.destroyed') }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :picture, :role, :blsd_expires_at, group_ids: [])
  end
end
