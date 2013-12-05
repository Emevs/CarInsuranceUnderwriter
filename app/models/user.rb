require 'bcrypt'
class User < ActiveRecord::Base
  include 'bcrypt'
  has_one :person, :dependent => destroy

  # Method from http://bcrypt-ruby.rubyforge.org/
  def password
    @password ||= Password.new(password_hash)
  end

  # Method from http://bcrypt-ruby.rubyforge.org/
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
