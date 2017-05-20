Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # proizvodi
  get "/products/all_products", to: "products#all_products"
  post "/products/create_product", to: "products#create_product"
  post "/products/update_product", to: "products#update_product"
  post "/products/delete_product", to: "products#delete_product"

  # korisnici
  post "/users/login", to: "users#login"
  post "/users/logout", to: "users#logout"
  post "/users/edit_user_data", to: "users#edit_user_data"
  post "/users/edit_password", to: "users#edit_password"
  post "/users/register_buyer", to: "users#register_buyer"

  #admin
  post "/users/admin/get_my_vendors", to: "users#get_my_vendors"
  get "/users/admin/get_buyers", to: "users#get_buyers"
  post "/users/admin/register_vendor", to: "users#register_vendor"
  post "/users/admin/delete_buyer", to: "users#delete_buyer"
  post "/users/admin/delete_vendor", to: "users#delete_vendor"

  # gradovi
  get "/cities/all_cities", to: "cities#all_cities"

  # kategorije
  get "/categories/all_categories", to: "categories#get_categories"
  post "/categories/delete_category", to: "categories#delete_category"
  post "/categories/create_category", to: "categories#create_category"
  post "/categories/update_category", to: "categories#update_category"


  # kupovina
  post "/receipts/buy", to: "receipts#buy"

  # stavke kupovine
  post "/purchases/bought", to: "purchases#bought"
  post "/purchases/sold", to: "purchases#sold"
  post "/purchases/set_on_the_way", to: "purchases#set_on_the_way"

  # proporuciteljski sustav
  post "/recommendation_system/recommand", to: "application#recommand"
end
