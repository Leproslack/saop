json.array!(@qbuilders) do |qbuilder|
  json.extract! qbuilder, :id, :name
  json.url qbuilder_url(qbuilder, format: :json)
end
