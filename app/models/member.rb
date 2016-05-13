class Member < ActiveRecord::Base
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true
end
