require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    before do
      User.create(firstname: "Trial", lastname: "User", email: "trial.user@#{ENV["ALLOWED_HOST_DOMAIN"]}")
    end

    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
