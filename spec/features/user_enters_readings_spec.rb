require "rails_helper"

RSpec.feature "user enters readings" do
  context "successfully" do
    scenario "by entering glucose level information" do
      visit root_path
      fill_in "reading[glucose_level]", with: 10
      click_button "Submit"
      within("#flash_success") do
        expect(page).to have_content("Reading of 10 mg/dl successfully submitted")
      end
    end
  end

  context "unsuccessfully" do
    scenario "by trying to add more than 4 readings in the same day" do
      4.times do
        create(:reading)
      end

      visit root_path
      fill_in "reading[glucose_level]", with: 10
      click_button "Submit"
      within("#flash_error") do
        expect(page).to have_content "Reading cannot be entered more than 4 times per day"
      end
    end

    scenario "by entering a decimal for glucose level" do
      visit root_path
      fill_in "reading[glucose_level]", with: 10.5
      click_button "Submit"

      error_message = "Glucose level must be an integer"
      within("#flash_error") do
        expect(page).to have_content error_message
      end
    end

    scenario "by entering a decimal for glucose level" do
      visit root_path
      fill_in "reading[glucose_level]", with: "my glucose level is ten"
      click_button "Submit"

      error_message = "Glucose level is not a number"
      within("#flash_error") do
        expect(page).to have_content error_message
      end
    end
  end
end
