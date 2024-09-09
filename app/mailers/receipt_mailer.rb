# frozen_string_literal: true

class ReceiptMailer < ApplicationMailer
  def collaborator_receipt_email
    @expense = params[:expense]

    generator = Pdf::CollaboratorsReceiptGenerator.new(expense: @expense)
    pdf_path = generator.call

    attachments['receipt.pdf'] = File.read(pdf_path)
    mail(to: @expense.user.email, subject: I18n.t('expenses.collaborator_email.subject'))
  end

  def member_receipt_email
    @payment = params[:payment]

    generator = Pdf::MembersReceiptGenerator.new(payment: @payment)
    pdf_path = generator.call

    attachments['receipt.pdf'] = File.read(pdf_path)
    mail(to: @payment.member.email, subject: I18n.t('payments.member_email.subject'))
  end
end
