json.array!(@quotes) do |quote|
  json.extract! quote, :vehicle_id, :quote_reference, :amount
  json.url quote_url(quote, format: :json)
end
