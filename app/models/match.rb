class Match < ApplicationRecord
  belongs_to :member1, class_name: "Member", foreign_key: :member1_id
  belongs_to :member2, class_name: "Member", foreign_key: :member2_id

  def self.draw_time
    if Match.any?
      self.first.created_at.strftime("%d %B %Y")
    end
  end
end
