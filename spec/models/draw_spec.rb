require 'rails_helper'

RSpec.describe Draw, type: :model do
  describe "validations" do
    it { is_expected.to have_many(:matches) }
  end
end
