require 'rails_helper'

feature "signing up" do
  context "signing up with the valid details" do
    scenario "allows a new member to be created and displayed" do
      visit "/members"
      click_link "Join Random Coffee"
      expect(current_path).to eq "/members/new"
      fill_in "member_firstname", with: "Joe"
      fill_in "member_lastname", with: "Bloggs"
      fill_in "member_email", with: "joe@gmail.com"
      click_button "Join!"
      expect(page).to have_content "Joe Bloggs"
      expect(current_path).to eq "/members"
    end
  end

  context "signing up with invalid details" do
    scenario "does not create a new member" do
      visit "/members"
      click_link "Join Random Coffee"
      fill_in "member_firstname", with: ""
      fill_in "member_lastname", with: "Bloggs"
      fill_in "member_email", with: "joe@gmail.com"
      click_button "Join!"
      expect(page).not_to have_content "Bloggs"
      expect(page).to have_content "Firstname can't be blank"
    end
  end
end
