json.array! @guests do |guest|
  json.extract! guest, :id, :name, :age, :favorite_color
end
