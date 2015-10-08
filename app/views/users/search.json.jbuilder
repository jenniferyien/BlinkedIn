json.alumnis do
  json.array!(@alumnis) do |alumni|
    json.extract! alumni, :avatar, :view
    json.first_name alumni.user.first_name
    json.last_name alumni.user.last_name
    json.location_city alumni.location.city
    json.location_state alumni.location.state
  end
end
json.employers do
  json.array!(@employers) do |employer|
    json.extract! employer, :avatar, :company_name
    json.location_city employer.location.city
    json.location_state employer.location.state
  end
end
