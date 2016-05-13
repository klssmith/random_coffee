class Member < ActiveRecord::Base
  validates :firstname, :lastname, presence: true
  validates :email, uniqueness: true
end
