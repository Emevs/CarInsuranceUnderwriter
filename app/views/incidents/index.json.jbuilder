json.array!(@incidents) do |incident|
  json.extract! incident, :driver_history_id, :date_of_incident, :claim_value, :incident_type, :description
  json.url incident_url(incident, format: :json)
end
