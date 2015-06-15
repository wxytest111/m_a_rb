json.array!(@workers) do |worker|
  json.extract! worker, :id, :name, :mobile, :avatar, :star, :gender, :description, :skills
  json.url worker_url(worker, format: :json)
end
