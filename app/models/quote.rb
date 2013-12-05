class Quote < ActiveRecord::Base
  belongs_to :vehicle

  validates_presence_of :quote_reference, :amount, :vehicle_id

  validates_numericality_of :amount,
                            :greater_than_or_equal_to => 0

  validates_uniqueness_of :quote_reference
end