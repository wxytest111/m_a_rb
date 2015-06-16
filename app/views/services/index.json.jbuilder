json.array!(@services) do |service|
  json.extract! service, :id, :price, :description, :pic, :name
  json.url service_url(service, format: :json)
end
