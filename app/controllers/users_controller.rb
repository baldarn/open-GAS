# frozen_string_literal: true

class UsersController < BaseController
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
      respond_to do |format|
        format.html { redirect_to new_club_user_url(@club), flash: { notice: I18n.t('users.created') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('users.created') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def update
    @user = @club.users.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to club_users_url(@club), flash: { notice: I18n.t('users.updated') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('users.updated') }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def destroy
    @user = @club.users.find(params[:id])
    @user.destroy

    redirect_to club_users_url(@club), flash: { success: I18n.t('users.destroyed') }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :picture)
  end
end
