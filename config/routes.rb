Rails.application.routes.draw do
  resources :formquestions
  resources :forms do
      resources :formquestions
  end
  resources :categories
  resources :qbuilders
  resources :polls do
    resources :questions do
      resources :answers
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
