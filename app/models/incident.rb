
class Incident < ActiveRecord::Base

  validates_presence_of :driver_history_id, :date_of_incident, :claim_value, :incident_type, :description

end
