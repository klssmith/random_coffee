class Member < ActiveRecord::Base
  before_save :downcase_email
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  has_one :match_one, class_name: "Match", foreign_key: :member1_id
  has_one :match_two, class_name: "Match", foreign_key: :member2_id

  has_one :member1, through: :match_two
  has_one :member2, through: :match_one

  def matched_member
    member1 || member2
  end

private

  def downcase_email
    self.email = email.downcase
  end
end
