Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    post "/products" => "products#create"
    delete "/products/:id" => "products#destroy"

    get "/images" => "images#index"
    get "/images/:id" => "images#show"
    patch "/images/:id" => "images#update"
    post "/images" => "images#create"
    delete "/images/:id" => "images#destroy"
  end
end
