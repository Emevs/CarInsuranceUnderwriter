class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of(:house_name_or_number, :street_name, :county, :city, :postcode, :user_id)
  validates_uniqueness_of(:user_id)
end
