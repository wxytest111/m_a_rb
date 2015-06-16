json.result @result
json.errorcode @error_code
json.errormsg @error_msg
json.data @services do |service|
  json.extract! service, :id, :name, :price, :pic, :description, :address
end
