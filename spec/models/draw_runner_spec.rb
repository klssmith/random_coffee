require 'rails_helper'

RSpec.describe DrawRunner do
  before do
    FactoryGirl.create(:member)
    FactoryGirl.create(:member, firstname: "Sarah", lastname: "Jones")
  end

  describe ".run" do
    it "populates the Matches" do
      expect{ DrawRunner.run }.to change { Match.count }.by(1)
    end

    context "with an odd number of members" do
      it "member2_id of the last match is nil" do
        Member.last.destroy
        DrawRunner.run
        expect(Match.last.member2_id).to be_nil
      end
    end
  end
end
