json.array!(@steps) do |step|
  json.extract! step, :id, :number, :product_id
  json.url step_url(step, format: :json)
end
