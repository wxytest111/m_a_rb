json.array!(@pay_records) do |pay_record|
  json.extract! pay_record, :id, :customer_id, :product_id, :shop_id, :pay_state, :pay_num, :pay_time, :total_count, :left_count
  json.url pay_record_url(pay_record, format: :json)
end
