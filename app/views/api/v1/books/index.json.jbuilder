json.array! @books do |book|
  json.id book.id
  json.name book.name
  json.publisher book.publisher
end