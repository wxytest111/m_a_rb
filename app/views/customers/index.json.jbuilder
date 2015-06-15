json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :mobile, :address, :description, :gender, :nick_name, :password
  json.url customer_url(customer, format: :json)
end
