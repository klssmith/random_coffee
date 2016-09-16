require 'rails_helper'

feature "visiting page with member email addresses" do
  before do
    visit user_google_oauth2_omniauth_authorize_path
    FactoryGirl.create(:member, email: "joe@example.com")
    FactoryGirl.create(:member, email: "jenny@example.com")
    FactoryGirl.create(:member, email: "jill@example.com")
    FactoryGirl.create(:member, email: "jack@example.com")
  end

  scenario "gives a CSV with email addresses of all members" do
    visit '/member_email_addresses.csv'
    expect(page.body).to include("jill@example.com")
    expect(page.body.count("\n")).to eq 4
  end
end
