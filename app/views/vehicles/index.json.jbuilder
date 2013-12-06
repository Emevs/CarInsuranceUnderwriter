json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :vehicle_registration, :annual_mileage, :estimated_value, :parking_location, :policy_start_date, :user_id
  json.url vehicle_url(vehicle, format: :json)
end
