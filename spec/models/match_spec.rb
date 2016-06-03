require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validations" do    
    it { is_expected.to belong_to(:member1).class_name("Member") }
    it { is_expected.to belong_to(:member2).class_name("Member") }
  end

  describe ".draw_time" do
    before { Timecop.freeze("2016-05-27 14:39:58") }
    after { Timecop.return }

    context "when there are no matches" do
      it "returns nil" do
        expect(Match.draw_time).to be_nil
      end
    end

    context "when there are matches" do
      it "returns the date of the first match" do
        FactoryGirl.create(:match)
        expect(Match.draw_time).to eq "27 May 2016"
      end
    end
  end
end
