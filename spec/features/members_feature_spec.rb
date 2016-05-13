require 'rails_helper'

feature 'members' do
  context 'there are no members of Random Coffee' do
    scenario 'should display a message that there are no members' do
      visit '/members'
      expect(page).to have_content "No one has signed up yet. Why not be the first?"
      expect(page).to have_link "Join Random Coffee"
    end
  end

  context 'there are members of Random Coffee' do
    before :each do
      Member.create(firstname: "Firstname", lastname: "Lastname")
    end

    scenario 'should display the names of the members' do
      visit '/members'
      expect(page).to have_content "Firstname Lastname"
      expect(page).not_to have_content "No one has signed up yet. Why not be the first?"
    end
  end
end
