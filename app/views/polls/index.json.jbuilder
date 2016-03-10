json.array!(@polls) do |poll|
  json.extract! poll, :id, :name
  json.url poll_url(poll, format: :json)
end
