json.array!(@products) do |product|
  json.extract! product, :id, :name, :pic, :address, :description
  json.url product_url(product, format: :json)
end
