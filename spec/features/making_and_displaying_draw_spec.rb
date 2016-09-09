require 'rails_helper'

feature "making and displaying the draw" do
  before do
    Timecop.freeze("2016-05-27 14:39:58")
    visit user_google_oauth2_omniauth_authorize_path
    ActionMailer::Base.deliveries.clear
  end

  after do
    Timecop.return
  end

  context "when a draw has never been made" do
    scenario "displays a message that there are no results" do
      visit root_path
      expect(page).to have_content "There are no draw results"
    end

    scenario "does not display a draw time" do
      visit root_path
      expect(page).not_to have_content "27 May 2016"
    end
  end

  context "when a draw has been made" do
    context "when there are members" do
      before do
        FactoryGirl.create(:member)
        FactoryGirl.create(:member, firstname: "Sarah", lastname: "Jones")
      end

      scenario "displays the names of the members" do
        visit admin_path
        click_on "Make the Random Coffee draw"
        expect(page).not_to have_content "There are no draw results"
        expect(page).to have_content "Joe Bloggs"
        expect(page).to have_content "Sarah Jones"
      end

      scenario "displays the time of the last draw" do
        visit admin_path
        click_on "Make the Random Coffee draw"
        expect(page).to have_content "27 May 2016"
      end

      scenario "sends the notification emails" do
        visit admin_path
        click_on "Make the Random Coffee draw"
        expect(ActionMailer::Base.deliveries.count).to eq 2
      end
    end

    context "when there are no members" do
      scenario "displays a message that there are no results" do
        visit admin_path
        click_on "Make the Random Coffee draw"
        expect(page).to have_content "There are no draw results"
      end

      scenario "does not send any notification emails" do
        visit admin_path
        click_on "Make the Random Coffee draw"
        expect(ActionMailer::Base.deliveries.count).to eq 0
      end
    end
  end
end
