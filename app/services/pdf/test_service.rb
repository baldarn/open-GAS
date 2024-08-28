# frozen_string_literal: true

require 'prawn/measurement_extensions'

module Pdf
  class TestService
    attr_reader :model

    def initialize(model)
      @model = model
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

      document = Prawn::Document.new(layout) do |pdf|
        pdf.font_size 8.4.pt
        pdf.default_leading 5.pt
        pdf.line_width = 0.5.pt

        padding = 10.pt

        pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.right, height: 3.in) do
          pdf.indent(padding, padding) do
            pdf.move_down padding
            pdf.text 'OpenGAS', size: 14.pt, style: :bold
          end
          pdf.stroke_horizontal_rule
        end
      end

      document.render
    end
  end
end
