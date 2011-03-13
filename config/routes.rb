# config/routes.rb
Proj2docverncent285hcc::Application.routes.draw do
  match "pages/login" => "pages#login", :via => [:get,:post]

  get "pages/logout"

  match "user_suggestions/index" => "user_suggestions#index"
end
