Rails.application.routes.draw do
  devise_for :users
  resource :poll

  root to: "home#index"
end
