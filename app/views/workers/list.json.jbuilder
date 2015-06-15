json.result @result
json.errorcode @error_code
json.errormsg @error_msg

json.data @workers do |worker|
  json.extract! worker, :id, :name, :mobile, :avatar, :pic, :star, :gender, :description, :skills, :status
end
