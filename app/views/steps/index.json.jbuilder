json.array!(@steps) do |step|
  json.extract! step, :id, :number, :name, :product_id
  json.url step_url(step, format: :json)
end
