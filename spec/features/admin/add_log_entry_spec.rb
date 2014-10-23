require 'rails_helper'

RSpec.feature do
  scenario 'An admin adds a report' do
    visit '/admin'
    click_on 'New'
    fill_in ''
    pending 'Requires basic auth'
  end
end
