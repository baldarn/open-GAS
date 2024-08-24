# frozen_string_literal: true

class ExpensesController < BaseController
  before_action :current_user_is_admin?

  def index
    @expense_reason = params[:expense_reason_id] ? @club.expense_reasons.find(params[:expense_reason_id]) : nil

    @expenses = @club.expenses
    @expenses = @expenses.joins(:expense_reason).where(expense_reason: { id: @expense_reason.id }) if @expense_reason
    @expenses = @expenses.page(params[:page])
  end

  def new
    @expense = @club.expenses.new
  end

  def edit
    @expense = @club.expenses.find(params[:id])
  end

  def create
    @expense = @club.expenses.build(expense_params)

    if @expense.save
      redirect_to club_expenses_url(@club), flash: { notice: I18n.t('expenses.created') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @expense = @club.expenses.find(params[:id])

    if @expense.update(expense_params)
      redirect_to club_expenses_url(@club), flash: { notice: I18n.t('expenses.updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = @club.expenses.find(params[:id])
    @expense.destroy

    redirect_to club_expenses_url(@club), flash: { success: I18n.t('expenses.destroyed') }
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :expense_reason_id)
  end
end
