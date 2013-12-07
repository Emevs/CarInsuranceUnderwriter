class PolicyFeature < ActiveRecord::Base
  belongs_to :vehicle

  COVER_TYPE = ['At Home', 'European', 'Roadside', 'None']

  validates_presence_of :policy_excess, :breakdown_cover, :windscreen_repair, :vehicle_id

  validates_inclusion_of :breakdown_cover, :in => COVER_TYPE
  validates_inclusion_of :windscreen_repair, :in => ['Yes', 'No']
end
