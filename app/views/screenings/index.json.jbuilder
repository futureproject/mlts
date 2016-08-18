json.array!(@screenings) do |screening|
  json.extract! screening, :id, :screening_time, :city, :country, :link, :venue_name, :street_address
  json.url screening_url(screening, format: :json)
end
