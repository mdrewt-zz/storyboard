require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :stories
  has_many :segments

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by(email: params[:email]) || User.new
    user.password == params[:password]
  end

end
