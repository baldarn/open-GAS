# frozen_string_literal: true

Dir[Rails.root.join('lib/rails_ext/*').to_s].each { |path| require "rails_ext/#{File.basename(path)}" }
