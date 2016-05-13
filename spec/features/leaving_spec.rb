require 'rails_helper'

feature "leaving Random Coffee" do
  before(:each) do
    FactoryGirl.create(:member)
  end
end
