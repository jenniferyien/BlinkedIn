@endorsements = @alumni.endorsements
json.extract! @alumni, :id, :user_id, :location_id, :about, :q1, :q2, :q3, :position, :view, :fun_fact, :created_at, :updated_at
json.endorsements @endorsements do |endorsement|
  json.skill Skill.find_by(id: endorsement.skill_id).name
  json.skill_id endorsement.skill_id
  json.endorsed_by_user_id endorsement.user_id
end
