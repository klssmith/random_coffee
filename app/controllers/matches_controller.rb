class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @draw_time = Match.draw_time
  end

  def new
  end

  def create
    DrawRunner.run

    Member.all.each do |member|
      MemberMailer.draw_result_email(member).deliver_now
    end

    flash[:notice] = "The draw has been made!"
    redirect_to root_url
  end
end
