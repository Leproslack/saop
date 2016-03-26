json.array!(@newcategories) do |newcategory|
  json.extract! newcategory, :id, :new_category_name
  json.url newcategory_url(newcategory, newcategoryat: :json)
end
