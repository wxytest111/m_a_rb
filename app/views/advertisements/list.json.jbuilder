json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :url, :address
  json.url advertisement_url(advertisement, format: :json)
end
