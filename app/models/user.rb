class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.)+[a-z]+\z/i
  enum role: [:normal, :admin]

  validates :firstname, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true , length: {minimum: 8}

  before_save :email_downcase
  before_create :set_default_role

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
  def set_default_role
    self.role ||= :normal
  end
  def email_downcase
    self.email = email.downcase
  end
end
