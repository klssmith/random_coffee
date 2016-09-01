require 'rails_helper'

feature "leaving Random Coffee" do
  before do
    visit user_google_oauth2_omniauth_authorize_path
    ActionMailer::Base.deliveries.clear
  end

  let (:current_user) { User.first }

  context "when there are no members" do
    scenario "displays a message that no one has signed up" do
      visit members_path
      expect(page).not_to have_css('.table-responsive')
      expect(page).to have_content("There are currently no members of the Random Coffee draw.")
    end
  end

  context "when there are members" do
    before do
      10.times { FactoryGirl.create(:member) }
    end

    scenario "does not display the message that no one has signed up" do
      expect(page).not_to have_content("There are currently no members of the Random Coffee draw.")
    end

    scenario "lets the current user remove other members" do
      member = FactoryGirl.create(:member, firstname: "Ava", lastname: "Lovelace", email: "ava.lovelace@example.com")
      expect(MemberMailer).to receive(:leaving_email).once.and_call_original

      visit members_path
      click_on "Remove Ava"
      expect(page).to have_content "Ava has been removed from Random Coffee"
      visit members_path
      expect(page).not_to have_content("Remove Ava")

      expect(Member.exists?(id: member.id)).not_to be true
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    context "when the current_user is a member" do
      scenario "the current user is able to leave the draw" do
        member = FactoryGirl.create(:member, email: current_user.email, user_id: current_user.id)
        visit members_path
        expect(MemberMailer).to receive(:leaving_email).once.and_call_original
        expect(page).to have_content("Leave the Random Coffee draw:")
        click_on "Remove me, Joe Bloggs"
        expect(page).to have_content "You have left Random Coffee"
        expect(page).to have_current_path(matches_path)
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end
    end

    context "when the current_user is not a member" do
      scenario "the user sees no option to leave" do
        visit members_path
        expect(page).to have_content("You are not a member of the Random Coffee draw.")
        expect(page).not_to have_content("Click below to remove yourself from the Random Coffee draw:")
        expect(page).not_to have_selector("input[type=submit][value='Remove me, Joe Bloggs']")
      end
    end
  end
end
