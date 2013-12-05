class Address < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :house_name_or_number, :street_name, :county, :city, :postcode
end
