json.array!(@foods) do |food|
  json.name        food.name
  json.id          food.id
end