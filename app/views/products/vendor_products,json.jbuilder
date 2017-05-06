json.array! @vendor_products do |product|
  json.id_product product.id
  json.title product.title
  json.description product.description
  json.price product.price
  json.availability product.availability
  json.picture nil
  json.email_seller product.email_seller
  json.categories product.categories do |category|
    json.name category.name
  end
end