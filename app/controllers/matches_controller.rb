class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @draw_time = Match.draw_time
  end

  def new
  end

  def create
    DrawRunner.run
    redirect_to '/matches'
  end
end
