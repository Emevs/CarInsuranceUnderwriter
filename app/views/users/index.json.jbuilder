json.array!(@users) do |user|
  json.extract! user, :uuid, :password
  json.url user_url(user, format: :json)
end
