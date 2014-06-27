require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :stories
  has_many :segments

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    email = params[:email]
    password = params[:password]
    p email
    p password
    User.find_by(email: email).password == password
  end

end
