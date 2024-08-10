# frozen_string_literal: true

class TagsController < BaseController
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
      respond_to do |format|
        format.html { redirect_to club_tags_url(@club), flash: { notice: I18n.t('tags.created') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('tags.created') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def update
    @tag = @club.tags.find(params[:id])

    if @tag.update(tag_params)
      respond_to do |format|
        format.html { redirect_to club_tags_url(@club), flash: { notice: I18n.t('tags.updated') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('tags.updated') }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
