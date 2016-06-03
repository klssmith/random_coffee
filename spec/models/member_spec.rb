require 'rails_helper'

RSpec.describe Member, type: :model do
  before { FactoryGirl.create(:member) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe "saving the email address" do
    it "saves email addresses lowercase" do
      user = FactoryGirl.create(:member, email: "EMAIL@EXAMPLE.com")
      expect(user.email).to eq "email@example.com"
    end
  end
end
