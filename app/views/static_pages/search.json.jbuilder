json.locations do
  json.array!(@locations) do |location|
    json.name location.name
    json.url location.id
  end
end

json.travellings do
  json.array!(@travellings) do |travelling|
    json.url travelling.location_end_id
  end
end

json.tours do
  json.array!(@tours) do |tour|
    json.url tour.title
    json.id tour.id
  end
end
