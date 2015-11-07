require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String
  property :password, BCryptHash, required: true,
  message: "Confirmation password and password are different"

  attr_accessor :password_confirmation

  validates_confirmation_of :password, confirm: :password_confirmation

end
