require 'rails_helper'

feature 'Signing up' do
  scenario 'A user can sign up for the service' do
    visit '/signup'

    fill_in 'user_email', with: 'mario@pipes.com'
    fill_in 'user_password', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content 'Choose the dropbox directory to sync org files from'
  end
end
