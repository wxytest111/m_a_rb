json.array!(@subscribes) do |subscribe|
  json.extract! subscribe, :id, :customer_id, :start_time, :end_time, :product_id, :pay_record_id, :name, :sex, :tel, :district_id, :address, :waitress_id, :state
  json.url subscribe_url(subscribe, format: :json)
end
