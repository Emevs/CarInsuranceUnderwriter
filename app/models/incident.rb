class Incident < ActiveRecord::Base
  belongs_to :driver_history

  # Force user to enter these values
  validates_presence_of :driver_history_id, :date_of_incident, :claim_value, :incident_type, :description
end
