require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  describe "POST /matches (#create)" do
    it "delivers the draw result email" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      ActionMailer::Base.deliveries.clear
      2.times { FactoryGirl.create(:member) }

      expect(MemberMailer).to receive(:draw_result_email).twice.and_call_original
      post :create

      expect(ActionMailer::Base.deliveries.count).to eq 2
    end
  end
end
