require 'rails_helper'

RSpec.feature 'Report viewing' do

  scenario 'A client views their latest report' do
    create :client, id: 1, token: '1234'
    create :report, client_id: 1, report_date: 1.day.ago, token: 'report1'
    create :report, client_id: 1, report_date: 2.days.ago, token: 'report2'

    visit '/clients/1234'
    expect(current_path).to eq '/reports/report1'
  end

  scenario 'A client views a specific report' do
    create :report, token: '1234'

    visit '/reports/1234'
    skip 'TODO'
  end

end
