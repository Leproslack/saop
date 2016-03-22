json.array!(@formbuilders) do |formbuilder|
  json.extract! formbuilder, :id, :category
  json.url formbuilder_url(formbuilder, format: :json)
end
