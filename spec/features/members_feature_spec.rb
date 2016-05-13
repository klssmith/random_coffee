require 'rails_helper'

feature "members" do
  context "there are no members of Random Coffee" do
    scenario "should display a message that there are no members" do
      visit "/members"
      expect(page).to have_content "No one has signed up yet. Why not be the first?"
      expect(page).to have_link "Join Random Coffee"
    end
  end

  context "there are members of Random Coffee" do
    before :each do
      Member.create(firstname: "Firstname", lastname: "Lastname")
    end

    scenario "should display the names of the members" do
      visit "/members"
      expect(page).to have_content "Firstname Lastname"
      expect(page).not_to have_content "No one has signed up yet. Why not be the first?"
    end
  end

  context "signing up with the valid details" do
    scenario "allows a new member to be created and displayed" do
      visit "/members"
      click_link "Join Random Coffee"
      expect(current_path).to eq "/members/new"
      fill_in "member_firstname", with: "Joe"
      fill_in "member_lastname", with: "Bloggs"
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
      click_button "Join!"
      expect(page).not_to have_content "Bloggs"
      expect(page).to have_content "Firstname can't be blank"
    end
  end
end
