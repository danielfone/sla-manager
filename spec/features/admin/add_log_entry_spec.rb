require 'rails_helper'

RSpec.feature do

  background do
    create :repository, name: 'test-app'
  end

  scenario 'An admin adds a report' do
    visit '/admin'
    click_on 'Log Entries'
    click_on 'Add Entry'
    select 'test-app', from: 'Repository'
    select 'Note', from: 'Entry type'
    fill_in 'Note', with: 'Test note'
    click_on 'Save'
    expect(page).to have_content 'test-app Note Test note'
  end
end
