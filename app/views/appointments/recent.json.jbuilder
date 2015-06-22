json.result @result
json.errorcode @error_code
json.errormsg @error_msg

json.data @appointments do |appointment|
  json.extract! appointment, :id, :status, :date, :address
  json.start_time appointment.start_time.strftime('%H:%M:%S')
  json.end_time appointment.end_time.strftime('%H:%M:%S')
  json.product appointment.product, :id, :name, :pic
  json.service appointment.service, :id, :name, :price
  json.customer appointment.customer, :id, :mobile, :address, :nick_name
  json.workers appointment.workers do |worker|
    json.extract! worker, :id, :name, :mobile, :star, :avatar, :description
  end
end