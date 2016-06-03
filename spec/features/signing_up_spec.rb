require 'rails_helper'

feature "signing up" do
  context "with valid details" do
    scenario "allows a new member to join and be displayed" do
      visit_sign_up_page
      sign_up_as("Joe", "Bloggs", "joe@gmail.com")
      expect(page).to have_current_path(members_path)
      expect(page).to have_content "Joe Bloggs"
    end
  end

  context "with invalid details" do
    scenario "does not allow the member to join and displays an error message" do
      visit_sign_up_page
      sign_up_as("", "", "")
      expect(page).not_to have_content "Bloggs"
      expect(page).to have_content "Firstname can't be blank"
      expect(page).to have_content "Lastname can't be blank"
      expect(page).to have_content "Email can't be blank"
    end
  end
end
