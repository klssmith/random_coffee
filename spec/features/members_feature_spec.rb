require 'rails_helper'

feature 'members' do
  context 'there are no members of Random Coffee' do
    scenario 'should display a message that there are no users' do
      visit '/members'
      expect(page).to have_content "No one has signed up yet. Why not be the first?"
      expect(page).to have_link "Join Random Coffee"
    end
  end
end
