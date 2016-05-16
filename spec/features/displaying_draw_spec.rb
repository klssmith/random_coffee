require 'rails_helper'

feature "making the draw" do
  context "when a draw has never been made" do
    scenario "displays a message that there is no draw" do
      visit "/matches"
      expect(page).to have_content "There are no draw results"
    end
  end
end
