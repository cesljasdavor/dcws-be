json.array! @cities do |city|
  json.city city.city
  json.postal_code city.postal_code
  json.id city.id
end