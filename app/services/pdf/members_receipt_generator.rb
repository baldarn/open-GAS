# frozen_string_literal: true

module Pdf
  class MembersReceiptGenerator
    attr_reader :club, :member, :payment

    def initialize(payment:)
      @payment = payment
      @member = payment.member
      @club = @member.club
    end

    def call
      path = Rails.root.join('tmp', filename)
      template = Rails.root.join('app/views/pdf/payments/receipt.html.erb')

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
      "pdf_#{payment.id}.pdf"
    end
  end
end
