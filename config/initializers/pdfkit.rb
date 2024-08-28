# frozen_string_literal: true

PDFKit.configure do |config|
  config.wkhtmltopdf = ENV.fetch('WKHTMLTOPDF_PATH', '/usr/local/bin/wkhtmltopdf')
  config.default_options = {
    page_size: 'A4',
    print_media_type: true
  }
  # Use only if your external hostname is unavailable on the server.
  # config.root_url = "http://localhost"
  config.verbose = Rails.env.development?
end
