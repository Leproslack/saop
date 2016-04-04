json.array!(@templates) do |template|
  json.extract! template, :id, :category, :score
  json.url template_url(template, format: :json)
end
