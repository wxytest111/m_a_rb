json.array!(@apply_shops) do |apply_shop|
  json.extract! apply_shop, :id, :name, :sex, :tel, :email, :creid, :company, :shop_id, :state
  json.url apply_shop_url(apply_shop, format: :json)
end
