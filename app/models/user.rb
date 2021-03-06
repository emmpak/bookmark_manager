
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,               Serial
  property :email,            String, required: true, format: :email_address, unique: true, :messages => { :is_unique => "An account with this email already exists"}
  property :password_digest,  Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
