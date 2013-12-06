json.array!(@addresses) do |address|
  json.extract! address, :user_id, :house_name_or_number, :street_name, :county, :city, :postcode
  json.url address_url(address, format: :json)
end
