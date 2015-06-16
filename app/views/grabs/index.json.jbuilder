json.array!(@grabs) do |grab|
  json.extract! grab, :id, :worker_id, :appointment_id, :status
  json.url grab_url(grab, format: :json)
end
