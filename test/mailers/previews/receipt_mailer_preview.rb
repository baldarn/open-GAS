# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview
  def collaborator_receipt_email
    expense = Expense.joins(:user).distinct.first
    ReceiptMailer.with(expense:).collaborator_receipt_email
  end

  def member_receipt_email
    ReceiptMailer.with(payment: Payment.first).member_receipt_email
  end
end
