Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :aaonoob

  resources :people

  resources :nickname

  resources :scratch

  resources :test
end
