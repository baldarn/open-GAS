# frozen_string_literal: true

class PaymentsController < BaseController
  before_action :set_member, if: -> { params[:member_id].present? }

  def index
    @payments = @club.payments.page(params[:page])
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

  private

  def payment_params
    params.require(:payment).permit(:amount, :reason)
  end

  def set_member
    @member = @club.members.find(params[:member_id])
  end
end
