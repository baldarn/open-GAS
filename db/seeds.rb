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
  born_at = Faker::Date.between(from: 10.years.ago, to: 40.years.ago)
  minor = born_at >= 18.years.ago
  Member.create!(
    club:,
    groups:,
    tags:,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    born_at:,
    born_in: Faker::Address.city,
    citizenship: Faker::Address.country,
    address: Faker::Address.full_address,
    postal_code: Faker::Address.postcode,
    municipality: Faker::Address.community,
    tax_code: Faker::Alphanumeric::ALPHANUMS,
    province: Faker::Address.community.first(2),
    telephone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    medical_certificate_kind: %i[regular competitive].sample,
    medical_certificate_expires_at: Faker::Date.forward,
    membership_id: Faker::Number.number,
    membership_expires_at: Faker::Date.forward,
    first_parent_first_name: minor ? Faker::Name.first_name : nil,
    first_parent_last_name: minor ? Faker::Name.last_name : nil,
    first_parent_born_at: minor ? Faker::Date.between(from: 20.years.ago, to: 70.years.ago) : nil,
    first_parent_born_in: minor ? Faker::Address.city : nil,
    first_parent_citizenship: minor ? Faker::Address.country : nil,
    first_parent_address: minor ? Faker::Address.full_address : nil,
    first_parent_postal_code: minor ? Faker::Address.postcode : nil,
    first_parent_municipality: minor ? Faker::Address.community : nil,
    first_parent_tax_code: minor ? Faker::Alphanumeric::ALPHANUMS : nil,
    first_parent_province: minor ? Faker::Address.community.first(2) : nil,
    first_parent_telephone: minor ? Faker::PhoneNumber.cell_phone : nil,
    first_parent_email: minor ? Faker::Internet.email : nil
  )
end

Faker::Config.locale = 'it'

club = Club.create!(
  name: 'The Club',
  email: 'club@email.com',
  address: 'via Roma',
  postal_code: '57100',
  municipality: 'Livorno',
  province: 'LI',
  tax_code: '12345678901'
)

admin = User.new(
  club:,
  first_name: 'admin',
  last_name: 'admin',
  email: 'admin@email.com',
  password: 'password',
  role: :admin
)
admin.skip_confirmation!
admin.save!

collaborator = User.new(
  club:,
  first_name: 'collaborator',
  last_name: 'collaborator',
  email: 'collaborator@email.com',
  password: 'password',
  role: :collaborator
)
collaborator.skip_confirmation!
collaborator.save!

children_group = club.groups.create!(name: 'children', default_amount: 60)
adults_group = club.groups.create!(name: 'adults', default_amount: 80)

black_belt_tag = club.tags.create!(name: 'black belt')
white_belt_tag = club.tags.create!(name: 'white belt')

payment_reason_quota = PaymentReason.create!(club:, reason: 'Quota associativa')
payment_reason_fruizione = PaymentReason.create!(club:, reason: 'Fruizione corso')

expense_reason_affitto = ExpenseReason.create!(club:, reason: 'Pagamento affitto')
expense_reason_materiali = ExpenseReason.create!(club:, reason: 'Materiali')

10.times do
  member = random_member(club, groups: [children_group], tags: [white_belt_tag])

  Payment.create!(member:, payment_reason: payment_reason_quota, amount: 50)
end

10.times do
  member = random_member(club, groups: [adults_group], tags: [black_belt_tag])

  Payment.create!(member:, payment_reason: payment_reason_quota, amount: 50)
end

5.times do
  member = random_member(club, groups: [adults_group, children_group])

  Payment.create!(member:, payment_reason: payment_reason_quota, amount: 50)
end

5.times do
  member = random_member(club, groups: [children_group], tags: [white_belt_tag, black_belt_tag])

  Payment.create!(member:, payment_reason: payment_reason_quota, amount: 50)
  Payment.create!(member:, payment_reason: payment_reason_fruizione, amount: 80)
end

3.times do
  Expense.create!(club:, expense_reason: expense_reason_affitto, amount: 1000)
  Expense.create!(club:, expense_reason: expense_reason_materiali, amount: 30)
end
