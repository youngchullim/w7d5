Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'
  

  namespace :api, defaults: {format: :json} do 
  # format json question, what is this line doing
    resources :session, only: [:create, :destroy]
    resources :users, only: [:create]
  end
end
