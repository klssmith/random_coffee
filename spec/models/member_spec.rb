require 'rails_helper'

RSpec.describe Member, type: :model do
  before { FactoryGirl.create(:member) }

  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
