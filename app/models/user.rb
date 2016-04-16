class User < ActiveRecord::Base
  TEMP_EMAIL_REGEX = /\Achange@me/
  #, :lockable, :timeoutable and
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update
  before_create :role_default
  enum role: [:visitors, :normal, :host, :admin]

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          email: auth.extra.raw_info.email,
          password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  private
  def role_default
    self.role ||= :normal
  end
end
