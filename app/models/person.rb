class Person < ActiveRecord::Base
  has_one :address, :dependent => :destroy
  belongs_to :user
  # Constants for validation
  LICENSE_TYPES = ['full', 'provisional']

  # Force the user to enter certain details.
  validates_presence_of(:forenames, :surname, :date_of_birth, :email, :title, :license_type, :license_period, :telephone_number, :occupation)

  # Check format of email address is valid.
  validates_format_of(:email,
                      with: /\A([\w\.\-\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      :message => 'format is incorrect.')

  # Check email address is unique.
  validates_uniqueness_of(:email)

  validates_numericality_of(:license_period,
                            :greater_than_or_equal_to => 0,
                            :message => 'must be numerical and greater than or equal to zero.')

  # Ensure the license type is one of these values.
  validates_inclusion_of(:license_type, :in => LICENSE_TYPES)

  def forenames=(value)
    write_attribute :forenames, (value ? value.humanize : nil)
  end

  def surname=(value)
    write_attribute :surname, (value ? value.humanize : nil)
  end
end
