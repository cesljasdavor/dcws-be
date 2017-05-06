# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Kategorije
# Category.create! name: "Muška odjeća", description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga."
# Category.create! name: "Ženska odjeća", description: " Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae."
# Category.create! name: "Ženska obuća", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
# Category.create! name: "Muška obuća", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
#
# # Mjesta
# City.create! postal_code: 10000, city: "Zagreb"
# City.create! postal_code: 21000, city: "Zadar"
# City.create! postal_code: 23000, city: "Split"
# City.create! postal_code: 22000, city: "Šibenik"
#
# # Useri
# User.create! email: "davor.cesljas@fer.hr", password: "password", name: "Davor", surname: "Češljaš", telephone_number: "0976958886", address: "Marina Tartaglie 12", privilege: 2, city_id: 1, date_of_birth: Date.strptime('27-07-1995', '%d-%m-%Y')
# User.create! email: "tomislav.cesljas@grad.hr", email_admin: "davor.cesljas@fer.hr", password: "password", name: "Tomislav", surname: "Češljaš", telephone_number: "0976955554", address: "Marina Tartaglie 12", privilege: 1, city_id: 1, date_of_birth: Date.strptime('11-07-1995', '%d-%m-%Y')
# User.create! email: "kreso.oreskovic@fer.hr", password: "password", name: "Krešo", surname: "Orešković", telephone_number: "0976456456", address: "Unska 3", privilege: 0, city_id: 2, date_of_birth: Date.strptime('11-01-1994', '%d-%m-%Y')
# User.create! email: "mihael.medan@fer.hr", email_admin: "davor.cesljas@fer.hr", password: "password", name: "Mihael", surname: "Međan", telephone_number: "0976456866", address: "Trg kralja Tomislava 5", privilege: 1, city_id: 3, date_of_birth: Date.strptime('12-03-1995', '%d-%m-%Y')
# Produkti
# Product.create! title: "Nike tenisice", description: "Tenisice marke Nike, plave", price: 1075.25, email_seller: "tomsilav.cesljas@grad.hr"
# Product.create! title: "Addidas tenisice", description: "Addidas tenisice, crvene, dragon", price: 956.99, email_seller: "mihael.medan@grad.hr"
# Product.create! title: "Pulover crni muški", description: "Crni pulover marke Tom Tailor", price: 586.56, email_seller: "tomsilav.cesljas@grad.hr"
# Product.create! title: "Top bijeli ženski", description: "Bijeli top marke Esprit", price: 1075.25, email_seller: "tomsilav.cesljas@grad.hr"


Product.all.each do |product|
  ProductCategory.create! product_id: product.id, category_id: Category.first.id
end


# Računi biti će poslije

