json.array!(@check_codes) do |check_code|
  json.extract! check_code, :id, :code, :mobile
  json.url check_code_url(check_code, format: :json)
end
