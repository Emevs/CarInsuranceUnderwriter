class Quote < ActiveRecord::Base
  self.primary_key = 'quote_reference'
  belongs_to :vehicle

  #  Force the user to enter these details.
  validates_presence_of(:quote_reference, :amount, :vehicle_id)

  # Make sure quote reference is unique.
  validates_uniqueness_of(:quote_reference, :id)
end