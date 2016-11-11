Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products' => 'products#display_all_products'
  get 'addproduct' => 'products#add_product'
  post 'addedproduct' => 'products#added_product_confirmation'
end
