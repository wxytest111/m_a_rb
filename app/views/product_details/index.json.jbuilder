json.array!(@product_details) do |product_detail|
  json.extract! product_detail, :id, :name, :description, :product_id
  json.url product_detail_url(product_detail, format: :json)
end
