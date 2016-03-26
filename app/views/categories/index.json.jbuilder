json.array!(@categories) do |category|
  json.extract! category, :id, :category_name, :poll_id
  json.url category_url(category, newcategoryat: :json)
end
