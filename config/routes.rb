Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists

  post 'artists/register' => 'artists#register'
end
