require "rails_helper"

RSpec.describe MemberMailer, type: :mailer do
  before { ActionMailer::Base.deliveries.clear }
  let(:member1) { FactoryGirl.build(:member, email: "joe@example.com") }

  describe "#draw_result_email" do
    let(:member2) { FactoryGirl.build(:member, firstname: "Jane", lastname: "Eyre", email: "jane@example.com") }
    let!(:match) { FactoryGirl.create(:match, member1: member1, member2: member2) }
    let(:email) { MemberMailer.draw_result_email(member1) }

    it "is delivered to the specified member" do
      expect(email.to).to eq(["joe@example.com"])
    end

    it "comes from the correct email address" do
      expect(email.from).to eq(["random-coffee@example.com"])
    end

    it "has the subject 'The Random Coffee draw result'" do
      expect(email.subject).to eq("The Random Coffee draw result")
    end

    it "contains the draw notification message in the email body" do
      expect(email.body.encoded).to include("Why not send Jane an email now to arrange to meet")
    end

    it "contains the email address of the match in the email body" do
      expect(email.body.encoded).to include("jane@example.com")
    end

    context "when a member has no match" do
      let(:member3) { FactoryGirl.build(:member, firstname: "Oliver", lastname: "Twist", email: "oliver@example.com") }

      it "the email body states that they have no match" do
        FactoryGirl.create(:match, member1: member3, member2: nil)
        email = MemberMailer.draw_result_email(member3)
        expect(email.body.encoded).to include("Unfortunately, you're the person without a match this month.")
      end
    end
  end

  describe "#joining_email" do
    let(:email) { MemberMailer.joining_email(member1) }

    it "is delivered to the specified member" do
      expect(email.to).to eq(["joe@example.com"])
    end

    it "comes from the correct email address" do
      expect(email.from).to eq(["random-coffee@example.com"])
    end

    it "has the subject 'You've joined the Random Coffee draw'" do
      expect(email.subject).to eq("You've joined the Random Coffee draw")
    end

    it "contains the welcome message in the email body" do
      expect(email.body.encoded).to include("Hello Joe")
      expect(email.body.encoded).to include("You're now signed up to the Random Coffee draw.")
    end
  end

  describe "#leaving_email" do
    let(:email) { MemberMailer.leaving_email(member1) }

    it "is delivered to the specified member" do
      expect(email.to).to eq(["joe@example.com"])
    end

    it "comes from the correct email address" do
      expect(email.from).to eq(["random-coffee@example.com"])
    end

    it "has the subject 'You have left the Random Coffee draw'" do
      expect(email.subject).to eq("You have left the Random Coffee draw")
    end

    it "contains the leaving message in the email body" do
      expect(email.body.encoded).to include("Hello Joe")
      expect(email.body.encoded).to include("You have now been removed from the Random Coffee draw.")
    end
  end
end
