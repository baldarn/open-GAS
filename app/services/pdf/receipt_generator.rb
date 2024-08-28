# frozen_string_literal: true

require 'prawn/measurement_extensions'

module Pdf
  class ReceiptGenerator
    attr_reader :club, :member, :payment

    def initialize(club:, member:, payment:)
      @club = club
      @member = member
      @payment = payment
    end

    def call
      path = Rails.root.join('tmp', filename)

      File.binwrite(path, to_pdf)
    end

    def filename
      "pdf_#{Time.current.to_i}.pdf"
    end

    private

    def to_pdf
      layout = {
        page_layout: :portrait,
        page_size: 'A4',
        margin: 5.mm
      }

      document = Prawn::Document.new(layout) do
        font_size 8.4.pt
        default_leading 5.pt

        padding = 10.pt

        bounding_box([0, bounds.top], width: bounds.right, height: 1.in) do
          stroke_bounds
          indent(padding, padding) do
            move_down padding
            text 'OpenGAS', size: 14.pt, style: :bold, valign: :center
            text 'Ricevuta nota spese', style: :bold, align: :center, valign: :center
            text club.full_name_and_address, align: :right, valign: :center
          end
          stroke_horizontal_rule
        end
      end

      document.render
    end
  end
end
