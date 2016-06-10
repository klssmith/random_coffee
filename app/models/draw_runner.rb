class DrawRunner
  def self.run
    new.shuffle_members
  end

  def shuffle_members
    shuffled_members = Member.all.shuffle
    populate_matches(shuffled_members)
  end

private

  def populate_matches(members)
    Match.delete_all
    members.each_slice(2) do |slice|
      Match.create(member1_id: slice[0].id,
      member2_id: slice[1] ? slice[1].id : nil)
    end
  end
end
