class Member < ApplicationRecord
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  has_one :match_one, class_name: "Match", foreign_key: :member1_id
  has_one :match_two, class_name: "Match", foreign_key: :member2_id

  has_one :member1, through: :match_two
  has_one :member2, through: :match_one

  belongs_to :user

  def matched_member
    member1 || member2
  end
end
