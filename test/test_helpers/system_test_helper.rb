# frozen_string_literal: true

module SystemTestHelper
  include ActionView::Helpers::JavaScriptHelper

  def sign_in(email_address, password = 'secret123456')
    visit new_session_url

    fill_in 'email_address', with: email_address
    fill_in 'password', with: password

    click_on 'log_in'

    assert_selector 'h1', text: 'Dashboard'
  end
end
