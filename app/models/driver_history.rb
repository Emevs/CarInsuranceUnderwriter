class DriverHistory < ActiveRecord::Base
  belongs_to :user
  has_many :incidents, :dependent => :destroy

  # Force the user to enter certain details.
  validates_presence_of(:number_of_incidents, :user_id)

  # Check number of incidents is equal to or greater than zero.
  validates_numericality_of(:number_of_incidents, :greater_than_or_equal_to => 0)
end
