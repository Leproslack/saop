json.array!(@stores) do |store|
  json.extract! store, :id, :store_name, :store_adress, :store_caregory
  json.url store_url(store, format: :json)
end
