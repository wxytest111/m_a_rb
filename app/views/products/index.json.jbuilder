json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :duration, :period, :effect, :applicable, :kind, :howuse, :total_count, :pic_path, :show_price, :pay_price, :state, :admin_id
  json.url product_url(product, format: :json)
end
