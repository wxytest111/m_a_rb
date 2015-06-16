json.result @result
json.errorcode @error_code
json.errormsg @error_msg

json.data @products do |product|
  json.extract! product, :id, :name, :pic, :address, :description
end
