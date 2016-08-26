require 'rails_helper'

feature "displaying members" do
  before do
    FactoryGirl.create(:member)
    visit user_google_oauth2_omniauth_authorize_path
  end

  context "when there are no members" do
    scenario "displays a message that no one has signed up" do
      visit "/members"
      click_link "Joe: leave Random Coffee"
      visit "/members"
      expect(page).not_to have_content "Joe Bloggs"
      expect(page).to have_content "No one has signed up yet. Why not be the first?"
    end
  end

  context "when there are members" do
    scenario "displays the names of the members" do
      visit "/members"
      expect(page).to have_content "Joe Bloggs"
      expect(page).not_to have_content "No one has signed up yet. Why not be the first?"
    end
  end
end
