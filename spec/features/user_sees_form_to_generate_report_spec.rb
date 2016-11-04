require "rails_helper"

RSpec.feature "user sees form to generate report" do
  scenario "when they visit the page" do
    visit root_path
    click_link "View a Report"

    expect(current_path).to eq reports_new_path

    within(".report-types") do
      expect(page).to have_content "Daily"
      expect(page).to have_content "Month to date"
      expect(page).to have_content "Monthly"
    end

  end
end
