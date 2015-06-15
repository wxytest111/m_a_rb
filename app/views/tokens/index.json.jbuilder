json.array!(@tokens) do |token|
  json.extract! token, :id, :token, :customer, :worker
  json.url token_url(token, format: :json)
end
