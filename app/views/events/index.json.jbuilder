json.array!(@events) do |event|
  json.extract! event, :id, :chef, :menu, :date, :location, :price, :persons
  json.url event_url(event, format: :json)
end
