require 'rails_helper'

feature "menu items displayed" do
  feature "'Log out' link" do
    scenario "only appears when a user is logged in" do
      visit root_path
      expect(page).not_to have_link("Log out")
      visit user_google_oauth2_omniauth_authorize_path
      expect(page).to have_link("Log out")
      click_on "Log out"
      expect(page).not_to have_link("Log out")
    end
  end
end
