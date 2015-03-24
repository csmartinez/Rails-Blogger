class User < ActiveRecord::Base
  has_many :posts
  validates :email, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates_uniqueness_of :email, on: :create
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
