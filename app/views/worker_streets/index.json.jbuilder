json.array!(@worker_streets) do |worker_street|
  json.extract! worker_street, :id, :worker_id, :street_id
  json.url worker_street_url(worker_street, format: :json)
end
