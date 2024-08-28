# frozen_string_literal: true

require 'application_system_test_case'

class RegistrationTest < ApplicationSystemTestCase
  test 'register user' do
    visit new_user_registration_url

    fill_in 'user_email', with: 'email@email.com'
    fill_in 'user_first_name', with: 'Name'
    fill_in 'user_last_name', with: 'Cognome'
    fill_in 'user_club_name', with: 'Club Name'
    fill_in 'user_club_email', with: 'email@club.com'
    fill_in 'user_club_address', with: 'via delle vie'
    fill_in 'user_club_postal_code', with: '12345'
    fill_in 'user_club_municipality', with: 'comune'
    fill_in 'user_club_province', with: 'RO'
    fill_in 'user_club_tax_code', with: '123432123'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_on 'commit'

    assert_selector 'h1', text: I18n.t('gas_title')

    registered_user = User.first
    assert registered_user.present?
    assert registered_user.club.present?
  end
end
