class User < ActiveRecord::Base
  #, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :role_default
  enum role: [:normal, :host, :admin]

  private
  def role_default
    self.role ||= :normal
  end
end
