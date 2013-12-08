class PolicyFeature < ActiveRecord::Base
  belongs_to :vehicle

  # It would have been better to have used an enumeration, some sort of config file,
  # or the database to store these values.
  COVER_TYPE = ['At Home', 'European', 'Roadside', 'None']

  # Force the user to enter certain details.
  validates_presence_of(:policy_excess, :breakdown_cover, :windscreen_repair, :vehicle_id)

  # Make sure breakdown cover and windscreen repair contain one of the specified values.
  validates_inclusion_of(:breakdown_cover, :in => COVER_TYPE)
  validates_inclusion_of(:windscreen_repair, :in => ['Yes', 'No'])
end
