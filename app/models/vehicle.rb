class Vehicle < ActiveRecord::Base
  belongs_to :personal_details

  PARKING_LOCATIONS = ['Garage', 'Driveway', 'Street', 'Secure Car park', 'Insecure Car Park']
  validates_presence_of :vehicle_registration, :annual_mileage, :estimated_value, :parking_location, :policy_start_date, :user_id

  validates_inclusion_of :parking_location, :in => PARKING_LOCATIONS

  validates_uniqueness_of :vehicle_registration

  validates_numericality_of :estimated_value,
                            :greater_than_or_equal_to => 0

  validates_numericality_of :annual_mileage,
                            :greater_than_or_equal_to => 0
end
