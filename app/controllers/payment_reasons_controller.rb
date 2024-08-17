# frozen_string_literal: true

class PaymentReasonsController < BaseController
  def index
    @payment_reason = @club.payment_reasons
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
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('payment_reasons.created') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @payment_reason = @club.payment_reasons.find(params[:id])

    if @payment_reason.update(expense_params)
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('payment_reasons.updated') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
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
