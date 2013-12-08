class User < ActiveRecord::Base
  has_one :personal_detail, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_one :vehicle, :dependent => :destroy
  has_one :driver_history, :dependent => :destroy

  # Make sure these fields are present.
  validates_presence_of(:username, :uuid, :password)
  # Check username and uuid (Universally unique identifier) are unique.
  validates_uniqueness_of(:username, :uuid)

end