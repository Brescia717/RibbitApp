class User < ActiveRecord::Base
  before_save :create_avatar_url
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  # before_action :authenticate_user!

  validates :username, presence: true

  has_many :ribbits
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  private
  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  end
end
