json.array!(@people) do |person|
  json.extract! person, :title, :forenames, :surname, :email, :date_of_birth, :telephone_number, :license_type, :license_period, :occupation, :references
  json.url person_url(person, format: :json)
end
