# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :redirect_to_root, unless: :user_signed_in?
  before_action :set_club

  def redirect_to_root
    redirect_to root_path
  end

  def set_club
    @club = current_user.club
  end

  def current_user_is_admin?
    head :unauthorized unless current_user.admin?
  end

  def resize_image(picture_param, height, width)
    return unless picture_param

    begin
      ImageProcessing::MiniMagick
        .source(picture_param)
        .resize_to_fit(width, height)
        .call(destination: picture_param.tempfile.path)
    rescue StandardError => _e
      # Do nothing. If this is catching, it probably means the
      # file type is incorrect, which can be caught later by
      # model validations.
    end
  end
end
