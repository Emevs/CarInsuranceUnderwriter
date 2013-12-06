json.array!(@driver_histories) do |driver_history|
  json.extract! driver_history, :user_id, :number_of_incidents
  json.url driver_history_url(driver_history, format: :json)
end
