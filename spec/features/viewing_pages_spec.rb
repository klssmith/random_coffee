require 'rails_helper'

feature "viewing pages" do
  context "when authorized" do
    scenario "shows the page content" do
      visit user_google_oauth2_omniauth_authorize_path
      expect(page).to have_content("Draw Results")
      expect(page).to have_content("Successfully authenticated from Google GDS account.")
      expect(page).not_to have_content("Sign in with your GDS Google account")
    end
  end

  context "when not authorized" do
    scenario "shows a login page" do
      visit root_path
      expect(page).to have_content("Sign in with your GDS Google account")
      expect(page).not_to have_content("Draw Results")
    end
  end
end
