require 'rails_helper'

feature "making and displaying the draw" do
  before do
    Timecop.freeze("2016-05-27 14:39:58")
  end

  after do
    Timecop.return
  end

  context "when a draw has never been made" do
    scenario "displays a message that there are no results" do
      visit "/matches"
      expect(page).to have_content "There are no draw results"
    end

    scenario "does not display a draw time" do
      visit "/matches"
      expect(page).not_to have_content "27 May 2016"
    end
  end

  context "when a draw has been made" do
    context "when there are members" do
      before do
        FactoryGirl.create(:member)
        FactoryGirl.create(:member, firstname: "Sarah", lastname: "Jones", email: "sjones@example.com")
      end

      scenario "displays the names of the members" do
        make_draw_and_view
        expect(page).not_to have_content "There are no draw results"
        expect(page).to have_content "Joe Bloggs"
        expect(page).to have_content "Sarah Jones"
      end

      scenario "displays the time of the last draw" do
        make_draw_and_view
        expect(page).to have_content "27 May 2016"
      end
    end

    context "when there are no members" do
      scenario "displays a message that there are no results" do
        make_draw_and_view
        expect(page).to have_content "There are no draw results"
      end
    end
  end
end
