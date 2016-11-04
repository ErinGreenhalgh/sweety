require "rails_helper"

RSpec.feature "user views a daily report" do

  let(:sept_readings)     { create_list(:reading, 4, created_at: DateTime.parse("September 2016"))}
  let(:oct_readings)      { create_list(:reading, 3, created_at: DateTime.parse("October 2016"))}
  let(:nov_1st_readings)  { create_list(:reading, 3, created_at: DateTime.parse("November 01 2016"))}
  let(:nov_2nd_readings)  { create_list(:reading, 4, created_at: DateTime.parse("November 02 2016"))}

  context "successfully" do
    scenario "by selecting a daily report", js: true do
      sept_readings
      oct_readings
      nov_1st_readings
      nov_2nd_readings

      visit reports_new_path

      expect(page).to have_css(".report-types")
      expect(page).not_to have_content("Select a Date:")
      expect(page).not_to have_content("Select a Month:")

      choose "report_type__daily"

      expect(page).to have_css("#select-date")

      find('#date').click
      find('#date option', text: '11-01-2016').click

      click_button "View Report"
      expect(current_path).to eq reports_results_path

      within(".report-data") do
        within("#max") do
          expect(page).to have_content("12 mg/dl")
        end
        within("#min") do
          expect(page).to have_content("10 mg/dl")
        end
        within("#avg") do
          expect(page).to have_content("11 mg/dl")
        end
      end
    end
  end
end
