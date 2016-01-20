json.array!(@shops) do |shop|
  json.extract! shop, :id, :uuid, :title, :name, :sex, :tel, :email, :creid, :company, :login_name, :login_pass, :subshop_count, :level
  json.url shop_url(shop, format: :json)
end
