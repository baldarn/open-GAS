# frozen_string_literal: true

class PaymentReasonsController < BaseController
  before_action :current_user_is_admin?

  def index
    @payment_reasons = @club.payment_reasons.page(params[:page])
  end

  def new
    @payment_reason = @club.payment_reasons.new
  end

  def edit
    @payment_reason = @club.payment_reasons.find(params[:id])
  end

  def create
    @payment_reason = @club.payment_reasons.build(expense_params)

    if @payment_reason.save
      redirect_to club_expense_reasons_url(@club), flash: { notice: I18n.t('payment_reasons.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @payment_reason = @club.payment_reasons.find(params[:id])

    if @payment_reason.update(expense_params)
      redirect_to club_expense_reasons_url(@club), flash: { notice: I18n.t('payment_reasons.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment_reason = @club.payment_reasons.find(params[:id])
    @payment_reason.destroy

    redirect_to club_payment_reasons_url(@club), flash: { success: I18n.t('payment_reasons.destroyed') }
  end

  private

  def expense_params
    params.require(:payment_reason).permit(:reason)
  end
end
