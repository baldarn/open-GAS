# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :set_club, only: %i[edit destroy]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    def create
      build_resource(sign_up_params)
      unless verify_rucaptcha?(nil, captcha: params[:user][:_rucaptcha])
        clean_up_passwords resource
        resource.errors.add(:_rucaptcha, '')
        return respond_with resource
      end

      params[:user][:registering] = true
      super

      return turbo_stream if @user.errors.present?

      @club = Club.create!(
        name: @user.club_name,
        email: @user.club_email,
        address: @user.club_address,
        postal_code: @user.club_postal_code,
        municipality: @user.club_municipality,
        province: @user.club_province,
        tax_code: @user.club_tax_code,
        telephone: @user.club_telephone
      )
      @user.club = @club
      @user.save
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    def destroy
      @club.destroy if @club.users.count == 1

      super
    end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: %i[first_name last_name registering club_name club_email club_address club_postal_code club_municipality
                 club_province club_tax_code club_telephone _rucaptcha]
      )
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    def set_club
      @club = current_user.club
    end
  end
end
