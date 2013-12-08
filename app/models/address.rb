class Address < ActiveRecord::Base
  belongs_to :user

  # Force the user to enter certain details.
  validates_presence_of(:house_name_or_number, :street_name, :county, :city, :postcode, :user_id)

  # Force an address to only belong to one user.
  validates_uniqueness_of(:user_id)
end
