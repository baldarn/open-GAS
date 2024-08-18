# frozen_string_literal: true

class PaymentsController < BaseController
  before_action :current_user_is_admin?
  before_action :set_member, if: -> { params[:member_id].present? }

  def index
    @member = params[:member_id] ? @club.members.find(params[:member_id]) : nil
    @payment_reason = params[:payment_reason_id] ? @club.payment_reasons.find(params[:payment_reason_id]) : nil

    @payments = @club.payments
    @payments = @payments.joins(:member).where(member: { id: @member.id }) if @member
    @payments = @payments.joins(:payment_reason).where(payment_reason: { id: @payment_reason.id }) if @payment_reason
    @payments = @payments.page(params[:page])
  end

  def new
    @payment = @member.payments.new
  end

  def edit
    @payment = @member.payments.find(params[:id])
  end

  def create
    @payment = @member.payments.build(payment_params)

    if @payment.save
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('payments.created') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @payment = @member.payments.find(params[:id])

    if @payment.update(payment_params)
      respond_to do |format|
        format.html { redirect_to root_url, flash: { notice: I18n.t('payments.updated') } }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = @club.payments.find(params[:id])
    @payment.destroy

    redirect_to club_payments_url(@club), flash: { success: I18n.t('payments.destroyed') }
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_reason)
  end

  def set_member
    @member = @club.members.find(params[:member_id])
  end
end
