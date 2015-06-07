json.array!(@beauticians) do |beautician|
  json.extract! beautician, :id, :name, :mobile, :id
  json.url beautician_url(beautician, format: :json)
end
