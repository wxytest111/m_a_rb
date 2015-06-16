json.result @result
json.errorcode @error_code
json.errormsg @error_msg

json.data @appointments do |appointment|
  json.extract! appointment, :id, :status, :date, :start_time, :end_time, :address
  json.product appointment.product.name
  json.service appointment.service.name
  json.customer appointment.customer, :id, :mobile, :address
end