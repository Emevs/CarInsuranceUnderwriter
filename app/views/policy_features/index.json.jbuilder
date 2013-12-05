json.array!(@policy_features) do |policy_feature|
  json.extract! policy_feature, :vehicle_id, :policy_excess, :breakdown_cover, :windscreen_repair, :windscreen_excess
  json.url policy_feature_url(policy_feature, format: :json)
end
