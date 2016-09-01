require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  before do
    allow(subject).to receive(:authenticate_user!)
    ActionMailer::Base.deliveries.clear
  end

  describe "POST /members (#create)" do
    it "delivers the joining email if a member is created" do
      expect(MemberMailer).to receive(:joining_email).once.and_call_original

      post :create, member: { firstname: "Joe", lastname: "Bloggs", email: "joe@example.com" }

      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it "it does not deliver any emails if a member is not created" do
      FactoryGirl.create(:member, email: "joe@example.com")
      expect(MemberMailer).not_to receive(:joining_email)

      post :create, member: { firstname: "Joe", lastname: "Bloggs", email: "joe@example.com" }

      expect(ActionMailer::Base.deliveries.count).to eq 0
    end
  end
end
