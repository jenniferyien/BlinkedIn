json.alumnis do
  json.array!(@alumnis) do |alumni|
    json.extract! alumni, :avatar, :view, :id, :user_id, :about, :position
    json.first_name alumni.user.first_name
    json.last_name alumni.user.last_name
    json.location_city alumni.location.city
    json.location_state alumni.location.state
  end
end
json.employers do
  json.array!(@employers) do |employer|
    json.extract! employer, :avatar, :company_name, :company_type, :description, :id, :user_id
    json.location_city employer.location.city
    json.location_state employer.location.state
  end
end
json.endorsement do
  json.array!(@endorsement) do |endorse|
    json.extract! endorse, :skill_id, :alumni_id, :user_id
    json.skill endorse.skill.name
    json.first_name endorse.user.first_name
    json.last_name endorse.user.last_name
    json.view endorse.alumni.view
    json.id endorse.alumni.id
    json.user_id endorse.alumni.user_id
    json.about endorse.alumni.about
    json.position endorse.alumni.position
    json.location_city endorse.alumni.location.city
    json.location_state endorse.alumni.location.state
    json.avatar endorse.alumni.avatar
  end
end
