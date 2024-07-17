source "https://rubygems.org"

ruby file: ".ruby-version"

gem "rails", "~> 7.1"

# Drivers
gem "sqlite3", "~> 1.4"
gem "redis", ">= 4.0.1"

# Deployment
gem "puma", ">= 5.0"

# Jobs
gem "resque", "~> 2.6.0"
gem "resque-pool", "~> 0.7.1"

# Front-end
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "bootstrap", "~> 5.1"
gem "sassc-rails"
gem "simple_form", "~> 5.3"

# Other
gem "sprockets-rails"
gem "useragent", github: "basecamp/useragent"
gem "jbuilder"
gem "redcarpet", "~> 3.6"
gem "rouge", "~> 4.2"
gem "bcrypt", "~> 3.1.7"
gem "image_processing", "~> 1.2"
gem "rqrcode"
gem "thruster"
gem "front_matter_parser"
gem "rails-i18n", "~> 7.0.0"

group :development, :test do
  gem "debug"
  gem "faker", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "htmlbeautifier"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
