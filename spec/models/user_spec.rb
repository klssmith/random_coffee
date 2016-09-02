require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    before { FactoryGirl.create(:user) }

    it { is_expected.to have_one(:member).dependent(:destroy) }

    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
