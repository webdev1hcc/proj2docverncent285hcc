# config/routes.rb
Proj2docverncent285hcc::Application.routes.draw do
  match "pages/login" => "pages#login", :via => [:get,:post]

  get "pages/logout"
  root :to => "pages#login"
  match "user_suggestions/index" => "user_suggestions#index"
  match "user_suggestions/new" => "user_suggestions#new"
  match "user_suggestions/create" => "user_suggestions#create"
  match "user_suggestions/chooseSuggestion" => "user_suggestions#chooseSuggestion"
  match "user_suggestions/edit" => "user_suggestions#edit"
  match "user_suggestions/update" => "user_suggestions#update"
end
