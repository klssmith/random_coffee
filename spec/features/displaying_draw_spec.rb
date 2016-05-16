require 'rails_helper'

feature "making the draw" do
  context "when a draw has never been made" do
    scenario "displays a message that there is no draw" do
      visit "/matches"
      expect(page).to have_content "There are no draw results"
    end
  end

  context "when a draw has been made" do
    before(:each) do
      FactoryGirl.create(:member)
      FactoryGirl.create(:member, firstname: "Sarah", lastname: "Jones", email: "sbrown@example.com")
    end

    scenario "displays the names of the members" do
      visit "/matches/new"
      click_link "Make the draw"
      visit "/matches"
      expect(page).not_to have_content "There are no draw results"
      expect(page).to have_content "Joe Bloggs"
      expect(page).to have_content "Sarah Jones"
    end
  end
end
