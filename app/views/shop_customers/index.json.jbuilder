json.array!(@shop_customers) do |shop_customer|
  json.extract! shop_customer, :id, :state, :shop_id, :customer_id
  json.url shop_customer_url(shop_customer, format: :json)
end
