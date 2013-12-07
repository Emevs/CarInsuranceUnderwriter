json.extract! @quote, :vehicle_id, :quote_reference, :amount, :created_at, :updated_at
json.extract! @vehicle, :policy_start_date
json.extract! @policy_feature, :policy_excess, :breakdown_cover, :windscreen_repair, :windscreen_excess
