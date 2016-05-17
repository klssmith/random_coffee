class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def create
    redirect_to '/matches'
  end
end
