json.array!(@alumnis) do |alumni|
  json.extract! alumni, :id, :user_id, :location_id, :about, :q1, :q2, :q3, :position, :view, :fun_fact
  json.url alumni_url(alumni, format: :json)
end
