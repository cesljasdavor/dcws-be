json.array! @products do |product|
  json.id_product product.id
  json.title product.title
  json.description product.description
  json.price product.price
  json.availability product.availability
  json.picture product.picture || "https://upload.wikimedia.org/wikipedia/commons/6/66/Svengraph_Box.png"
  json.email_seller product.email_seller
  json.categories product.categories do |category|
    json.name category.name
  end
end