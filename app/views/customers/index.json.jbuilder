json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :mobile, :gender
  json.url customer_url(customer, format: :json)
end
