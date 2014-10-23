require 'rails_helper'

RSpec.feature 'Report viewing' do

  scenario 'A client views a report' do
    visit '/reports/acbd1234'
    expect(page).to have_content 'foo'
  end

  pending 'unauthorized access to root?'

end
