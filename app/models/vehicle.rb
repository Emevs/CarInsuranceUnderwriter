class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :policy_features, :dependent => :destroy
  has_many :quotes, :dependent => :destroy

  # Parking location constant
  # It would have been better to have used an enumeration, some sort of config file,
  # or the database to store these values
  PARKING_LOCATIONS = ['Garage', 'Driveway', 'Street', 'Secure Car park', 'Insecure Car Park']

  # Ensure required fields are not blank.
  validates_presence_of(:vehicle_registration, :annual_mileage, :estimated_value, :parking_location,
                        :policy_start_date, :user_id)

  # Check to see if parking location is one of the specified values.
  validates_inclusion_of(:parking_location, :in => PARKING_LOCATIONS)

  # Check to see the estimated car value, and annual mileage are numerical and greater than zero.
  validates_numericality_of(:estimated_value, :greater_than_or_equal_to => 0)
  validates_numericality_of(:annual_mileage, :greater_than_or_equal_to => 0)
end
