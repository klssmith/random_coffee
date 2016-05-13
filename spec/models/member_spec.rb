require 'rails_helper'

RSpec.describe Member, type: :model do
  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
end
