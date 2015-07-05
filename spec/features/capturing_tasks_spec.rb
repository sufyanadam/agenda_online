require 'rails_helper'

feature 'Capturing tasks' do
  scenario 'User can capture a task' do
    visit '/capture-task'

  end
end
