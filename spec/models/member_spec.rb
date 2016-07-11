require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:member1) { FactoryGirl.create(:member) }

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

  describe "#match" do
    context "when the member has no match" do
      it "returns nil" do
        expect(member1.match).to be_nil
      end
    end

    context "when the member has a match" do
      let(:member2) { FactoryGirl.create(:member) }

      it "returns the matched member" do
        FactoryGirl.create(:match, member1_id: member1.id, member2_id: member2.id)

        expect(member1.match).to eq(member2)
        expect(member2.match).to eq(member1)
      end
    end
  end
end
