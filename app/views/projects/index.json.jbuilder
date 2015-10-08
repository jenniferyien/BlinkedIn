json.array!(@projects) do |project|
  json.extract! project, :id, :alumni_id, :name, :url, :description
  json.url project_url(project, format: :json)
end
