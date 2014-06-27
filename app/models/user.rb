class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :stories
  has_many :segments


  def self.authenticate(params)
    email = params[:email]
    password = params[:password]
    p email
    p password
    User.find_by(email: email).password == password
  end

end
