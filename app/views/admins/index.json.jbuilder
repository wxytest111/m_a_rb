json.array!(@admins) do |admin|
  json.extract! admin, :id, :username, :passwd, :type
  json.url admin_url(admin, format: :json)
end
