json.result @result
json.errorcode @error_code
json.errormsg @error_msg
json.data @advertisements do |advertisement|
  json.extract! advertisement, :id, :url, :address
end
