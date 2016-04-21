Rails.application.routes.draw do

  resources :template_fields
  resources :templates

  resources :polls 
  resources :categories do
    resources :questions
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
