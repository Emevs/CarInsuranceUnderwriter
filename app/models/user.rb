class User < ActiveRecord::Base
  has_one :personal_detail, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_one :vehicle, :dependent => :destroy
  has_one :driver_history, :dependent => :destroy


  validates_presence_of(:username, :uuid, :password)
  validates_uniqueness_of(:username, :uuid)


  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user.password != password
      user = nil
    end
    user
  end

end