# frozen_string_literal: true

module Pdf
  class CollaboratorsReceiptGenerator
    attr_reader :club, :user, :expense

    def initialize(expense:)
      @expense = expense
      @user = expense.user

      raise 'Expense is without collaborator!' unless @user

      @club = @user.club
    end

    def call
      path = Rails.root.join('tmp', filename)
      template = Rails.root.join('app/views/pdf/expenses/compensation.html.erb')

      html = ERB.new(template.read).result(binding)

      kit = PDFKit.new(
        html,
        page_size: 'A4', orientation: 'portrait',
        margin_top: '5mm', margin_bottom: '5mm',
        margin_left: '5mm', margin_right: '5mm'
      )
      kit.to_file(path)

      path
    end

    def filename
      "pdf_#{expense.id}.pdf"
    end
  end
end
