Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "book#list"
  get "books/new", to: "book#new"
  get "books/:id", to: "book#show" 
end
