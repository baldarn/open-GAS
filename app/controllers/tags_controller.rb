# frozen_string_literal: true

class TagsController < BaseController
  before_action :current_user_is_admin?

  def index
    @tags = @club.tags.page(params[:page])
  end

  def new
    @tag = @club.tags.build
  end

  def edit
    @tag = @club.tags.find(params[:id])
  end

  def create
    @tag = @club.tags.build(tag_params)

    if @tag.save
      redirect_to club_tags_url(@club), flash: { notice: I18n.t('tags.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @tag = @club.tags.find(params[:id])

    if @tag.update(tag_params)
      redirect_to club_tags_url(@club), flash: { notice: I18n.t('tags.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = @club.tags.find(params[:id])
    @tag.destroy

    redirect_to club_tags_url(@club), flash: { success: I18n.t('tags.destroyed') }
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
