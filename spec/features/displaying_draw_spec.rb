require 'rails_helper'

feature "making the draw" do
  before do
    FactoryGirl.create(:member)
    FactoryGirl.create(:member, firstname: "Sarah", lastname: "Jones", email: "sbrown@example.com")
    Timecop.freeze("2016-05-27 14:39:58")
  end

  after do
    Timecop.return
  end

  context "when a draw has never been made" do
    scenario "displays a message that there is no draw" do
      visit "/matches"
      expect(page).to have_content "There are no draw results"
    end

    scenario "does not display a draw time" do
      visit "/matches"
      expect(page).not_to have_content "27 May 2016"
    end
  end

  context "when a draw has been made" do
    scenario "displays the names of the members" do
      visit "/matches/new"
      click_link "Make the draw"
      visit "/matches"
      expect(page).not_to have_content "There are no draw results"
      expect(page).to have_content "Joe Bloggs"
      expect(page).to have_content "Sarah Jones"
    end

    scenario "displays the time of the last draw" do
      visit "/matches/new"
      click_link "Make the draw"
      visit "/matches"
      expect(page).to have_content "27 May 2016"
    end
  end
end
