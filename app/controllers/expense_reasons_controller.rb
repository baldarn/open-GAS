# frozen_string_literal: true

class ExpenseReasonsController < BaseController
  def index
    @expense_reasons = @club.expense_reasons.page(params[:page])
  end

  def new
    @expense_reason = @club.expense_reasons.new
  end

  def edit
    @expense_reason = @club.expense_reasons.find(params[:id])
  end

  def create
    @expense_reason = @club.expense_reasons.build(expense_params)

    if @expense_reason.save
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('expense_reasons.created') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('expense_reasons.created') }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @expense_reason = @club.expense_reasons.find(params[:id])

    if @expense_reason.update(expense_params)
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('expense_reasons.updated') } }
        format.turbo_stream { flash.now[:notice] = I18n.t('expense_reasons.updated') }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @expense_reason = @club.expense_reasons.find(params[:id])
    @expense_reason.destroy

    redirect_to club_expense_reasons_url(@club), flash: { success: I18n.t('expense_reasons.destroyed') }
  end

  private

  def expense_params
    params.require(:expense_reason).permit(:reason)
  end
end
