json.array!(@employers) do |employer|
  json.extract! employer, :id, :location_id, :user_id, :company_name, :website, :company_type, :description
  json.url employer_url(employer, format: :json)
end
