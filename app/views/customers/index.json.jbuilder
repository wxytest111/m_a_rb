json.array!(@customers) do |customer|
  json.extract! customer, :id, :uin, :passwd, :name, :sex, :tel, :address, :district_id
  json.url customer_url(customer, format: :json)
end
