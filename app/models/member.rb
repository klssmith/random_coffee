class Member < ActiveRecord::Base
  before_save :downcase_email
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def match
    if self.match_one
      Member.find(match_one.member2_id)
    elsif self.match_two
      Member.find(match_two.member1_id)
    end
  end

private

  def match_one
    Match.find_by(member1_id: self.id)
  end

  def match_two
    Match.find_by(member2_id: self.id)
  end

private

  def downcase_email
    self.email = email.downcase
  end
end
