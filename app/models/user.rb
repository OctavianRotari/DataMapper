require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String
  property :password, BCryptHash

  # def password=(password)
  #   self.password_digest = BCryptPassword.create(new_password)
  # end
end
