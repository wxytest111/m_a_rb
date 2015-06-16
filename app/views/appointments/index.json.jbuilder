json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :status, :date, :start_time, :end_time, :address, :product_id, :service_id, :customer_id
  json.url appointment_url(appointment, format: :json)
end
