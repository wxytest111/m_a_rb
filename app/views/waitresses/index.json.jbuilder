json.array!(@waitresses) do |waitress|
  json.extract! waitress, :id, :name, :description
  json.url waitress_url(waitress, format: :json)
end
