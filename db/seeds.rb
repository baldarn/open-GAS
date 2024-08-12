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

def random_member(club, groups: [], tags: [])
  Member.create!(
    club:,
    groups:,
    tags:,
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
    membership_id: Faker::Number.number,
    membership_expires_at: Faker::Date.forward
  )
end

Faker::Config.locale = 'it'

club = Club.create!(name: 'The Club', email: 'club@email.com')

user = User.new(
  club:,
  first_name: 'admin',
  last_name: 'admin',
  email: 'admin@email.com',
  password: 'password',
  role: :admin
)
user.skip_confirmation!
user.save!

children_group = club.groups.create!(name: 'children')
adults_group = club.groups.create!(name: 'adults')

black_belt_tag = club.tags.create!(name: 'black belt')
white_belt_tag = club.tags.create!(name: 'white belt')

10.times do
  member = random_member(club, groups: [children_group], tags: [white_belt_tag])

  Payment.create!(member:, amount: 50, reason: 'Quota associativa')
end

10.times do
  member = random_member(club, groups: [adults_group], tags: [black_belt_tag])

  Payment.create!(member:, amount: 50, reason: 'Quota associativa')
end

5.times do
  member = random_member(club, groups: [adults_group, children_group])

  Payment.create!(member:, amount: 50, reason: 'Quota associativa')
end

5.times do
  member = random_member(club, groups: [children_group], tags: [white_belt_tag, black_belt_tag])

  Payment.create!(member:, amount: 50, reason: 'Quota associativa')
end
