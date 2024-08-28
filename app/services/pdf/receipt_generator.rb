# frozen_string_literal: true

module Pdf
  class ReceiptGenerator
    attr_reader :club, :member, :payment

    BODY = <<~TEXT.squish
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <style>
            body {
              background: #6e28d9;
              padding: 0 24px;
              margin: 0;
              height: 100vh;
              color: white;
              display: flex;
              justify-content: center;
              align-items: center;
              font-family: Arial, Helvetica, sans-serif;
            }
          </style>
        </head>
        <body>

          <table style="width: 100%;">
          <tr>
          <td style="text-align: left;">openGAS</td>
          <td>RICEVUTA</td>
          <td style="width: 100px; text-align: right">club 1</td>
          </tr>
          </table>

        </body>
      </html>
    TEXT

    def initialize(payment:)
      @payment = payment
      @member = payment.member
      @club = payment.member.club
    end

    def call
      path = Rails.root.join('tmp', filename)

      kit = PDFKit.new(BODY, page_size: 'A4', orientation: 'portrait')
      kit.to_file(path)

      path
    end

    def filename
      "pdf_#{Time.current.to_i}.pdf"
    end

    private

    def to_pdf; end
  end
end
