require 'rails_helper'

feature "leaving Random Coffee" do
  before(:each) do
    FactoryGirl.create(:member)
  end

  scenario "removes a member when they click the link" do
    visit "/members"
    click_link "Joe: leave Random Coffee"
    expect(page).not_to have_content "Joe Bloggs"
    expect(page).to have_content "You have been removed successfully"
  end
end
