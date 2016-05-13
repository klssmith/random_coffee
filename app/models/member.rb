class Member < ActiveRecord::Base
  validates :firstname, :lastname, presence: true
end
