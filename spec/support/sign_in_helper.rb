module SignInHelper
  def visit_sign_up_page
    visit "/members"
    click_link "Join Random Coffee"
  end

  def sign_up_as(firstname, lastname, email)
    fill_in "member_firstname", with: firstname
    fill_in "member_lastname", with: lastname
    fill_in "member_email", with: email
    click_button "Join!"
  end
end

RSpec.configure do |config|
  config.include SignInHelper, type: :feature
end
