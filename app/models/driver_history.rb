class DriverHistory < ActiveRecord::Base
  belongs_to :person
  has_many :incidents

  validates_presence_of :number_of_incidents, :person_id

  validates_numericality_of :number_of_incidents,
                            :greater_than_or_equal_to => 0
end
