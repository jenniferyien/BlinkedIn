json.alumnis do
  json.array!(@alumnis) do |alumni|
    json.extract! alumni, :avatar, :view, :id, :user_id, :about, :position
    json.first_name alumni.user.first_name
    json.last_name alumni.user.last_name
    json.location_id alumni.location.id
    json.location_city alumni.location.city
    json.location_state alumni.location.state
    json.skills do
      json.array!(alumni.skills) do |skill|
        json.extract! skill, :name
      end
    end
  end
end
json.employers do
  json.array!(@employers) do |employer|
    json.extract! employer, :avatar, :company_name, :company_type, :description, :id, :user_id
    json.location_id employer.location.id
    json.location_city employer.location.city
    json.location_state employer.location.state
  end
end
json.locations do
  json.array!(@locations) do |location|
    json.extract! location, :id, :city, :state
  end
end
