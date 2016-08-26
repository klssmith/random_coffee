require 'rails_helper'

feature "joining the draw" do
  before do
    visit user_google_oauth2_omniauth_authorize_path
    @user = User.first
  end

  context "when the current user is not a member of the draw" do
    scenario "creates a new member who is linked to the current user" do
      visit new_member_path
      click_on "Join the Random Coffee draw"

      @member = Member.first

      expect(@member.firstname).to eq @user.firstname
      expect(@member.lastname).to eq @user.lastname
      expect(@member.email).to eq @user.email
      expect(@member.user_id).to eq @user.id
    end

    scenario "redirects the new member to the draw results page" do
      visit new_member_path
      click_on "Join the Random Coffee draw"
      expect(page).to have_current_path(matches_path)
    end
  end

  context "when the current user is a member of the draw" do
    scenario "does not show the 'Join the Random Coffee draw' button" do
      visit new_member_path
      click_on "Join the Random Coffee draw"

      visit new_member_path
      expect(page).not_to have_selector("input[type=submit][value='Join the Random Coffee draw']")
      expect(page).to have_content "You've already joined the draw."
    end
  end
end
