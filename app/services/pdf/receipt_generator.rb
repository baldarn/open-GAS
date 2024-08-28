# frozen_string_literal: true

module Pdf
  class ReceiptGenerator
    attr_reader :club, :member, :payment

    def initialize(payment:)
      @payment = payment
      @member = payment.member
      @club = payment.member.club
    end

    def call
      path = Rails.root.join('tmp', filename)

      kit = PDFKit.new(
        body,
        page_size: 'A4', orientation: 'portrait',
        margin_top: '5mm', margin_bottom: '5mm',
        margin_left: '5mm', margin_right: '5mm'
      )
      kit.to_file(path)

      path
    end

    def filename
      "pdf_#{Time.current.to_i}.pdf"
    end

    private

    def body
      <<~TEXT.squish
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="UTF-8">
            <style>
              body {
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
              }
            </style>
          </head>
          <body>

            <table style="width: 100%;">
              <tr>
                <td style="width: 200px; text-align: left;">openGAS</td>
                <td style="text-align: center; font-size: 2em; font-weight: bold;">RICEVUTA NOTA SPESE</td>
                <td style="width: 200px; text-align: right;">#{club.full_name_and_address_for_receipt}</td>
              </tr>
              <tr><td colspan="3"><hr/></td></tr>
            </table>

          </body>
        </html>
      TEXT
    end
  end
end
