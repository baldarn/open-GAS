# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Faker::Config.locale = 'it'

club = Club.create(name: 'The Club')

10.times do
  member = Member.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    born_at: Faker::Date.between(from: '2015-12-31', to: '2000-01-01'),
    born_in: Faker::Address.city,
    citizenship: Faker::Address.country,
    address: Faker::Address.full_address,
    postal_code: Faker::Address.postcode,
    municipality: Faker::Address.community,
    province: Faker::Address.community.first(2),
    telephone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    medical_certificate_kind: %i[regular competitive].sample,
    medical_certificate_expires_at: Faker::Date.forward,
    club:
  )

  Membership.create!(member:)
end

5.times do
  date_from = Faker::Date.forward(days: 30)

  Event.create!(
    kind: :training,
    date_from:,
    date_to: date_from + 2.hours
  )
end
