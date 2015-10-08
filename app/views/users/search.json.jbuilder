json.alumnis do
  json.array!(@alumnis) do |alumni|
    json.extract! alumni, :about, :fun_fact, :q1
    json.name alumni.user.first_name
  end
end
json.employers do
  json.array!(@employers) do |alumni|
    json.test('blah')
  end
end
