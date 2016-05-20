class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @draw_time = Match.first.created_at.strftime("%d %B %Y") if Match.any?
  end

  def new
  end

  def create
    shuffle_members
    redirect_to '/matches'
  end

private
  def shuffle_members
    shuffled_members = Member.all.shuffle
    populate_matches(shuffled_members)
  end

  def populate_matches(shuffled_members)
    Match.delete_all
    shuffled_members.each_slice(2) do |slice|
      Match.create(member1_id: slice[0].id, member2_id: slice[1].id)
    end
  end
end
