json.array!(@streets) do |street|
  json.extract! street, :id, :name, :area_id
  json.url street_url(street, format: :json)
end
