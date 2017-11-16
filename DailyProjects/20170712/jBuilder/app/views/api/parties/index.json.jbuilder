json.array! @parties do |party|
  json.extract! party, :name, :guests
end
