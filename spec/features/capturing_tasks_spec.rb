require 'rails_helper'

feature 'Capturing tasks' do
  scenario 'User can capture a task' do
    visit '/capture-task'

    fill_in 'task_text', with: 'Make dentist appointment'

    click_on 'Capture'

    expect(page).to have_content 'Make dentist appointment'
  end
end
