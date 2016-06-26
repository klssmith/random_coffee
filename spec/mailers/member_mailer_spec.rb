require "rails_helper"

RSpec.describe MemberMailer, type: :mailer do
  let(:member1) { FactoryGirl.build(:member, email: "joe@example.com") }
  let(:member2) { FactoryGirl.build(:member, firstname: "Jane", lastname: "Eyre", email: "jane@example.com") }
  let!(:match) { FactoryGirl.create(:match, member1: member1, member2: member2) }
  let(:email) { MemberMailer.draw_result_email(member1) }

  before { ActionMailer::Base.deliveries.clear }

  describe "email sender and recipient" do
    it "is delivered to the specified member" do
      expect(email.to).to eq(["joe@example.com"])
    end

    it "comes from the correct email address" do
      expect(email.from).to eq(["random-coffee@example.com"])
    end
  end

  describe "email contents" do
    it "contains the draw notification in the email body" do
      expect(email.body.encoded).to include("Why not send Jane an email now to arrange to meet")
    end

    it "contains the email address of the match in the email body" do
      expect(email.body.encoded).to include("jane@example.com")
    end

    it "has the correct subject" do
      expect(email.subject).to eq("The Random Coffee draw result")
    end
  end
end
