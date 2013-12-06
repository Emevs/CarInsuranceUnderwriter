json.array!(@personal_details) do |person|
  json.extract! personal_detail, :title, :forenames, :surname, :email, :date_of_birth, :telephone_number, :license_type, :license_period, :occupation, :references
  json.url personal_detail_url(personal_detail, format: :json)
end
