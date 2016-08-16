class User < ActiveRecord::Base
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  devise :database_authenticatable,
  :omniauthable, omniauth_providers: [:google_oauth2]

  has_one :member, dependent: :destroy

  def encrypted_password; end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user =  User.create(
      firstname: data["first_name"],
      lastname: data["last_name"],
      email: data["email"],
      image: data["image"]
      )
    end

    user
  end
end
