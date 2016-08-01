require 'rails_helper'

feature "leaving Random Coffee" do
  scenario "removes a member when they click the link" do
    FactoryGirl.create(:member)
    visit user_google_oauth2_omniauth_authorize_path
    visit "/members"
    click_link "Joe: leave Random Coffee"
    expect(page).not_to have_content "Joe Bloggs"
    expect(page).to have_content "You have been removed successfully"
    expect(page).to have_current_path(members_path)
  end
end
