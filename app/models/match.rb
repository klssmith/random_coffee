class Match < ActiveRecord::Base
  belongs_to :member1, class_name: "Member", foreign_key: :member1_id
  belongs_to :member2, class_name: "Member", foreign_key: :member2_id
end
