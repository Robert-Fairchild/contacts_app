Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  get "/contacts" => "contacts#create"
  get "/contacts/:id" => "contacts#show"
  get "/contacts/:id" => "contacts#update"
  get "/contacts/:id" => "contacts#destroy"
end


