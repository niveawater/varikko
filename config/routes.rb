Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" #jomeコントローラーのindexアクションを呼び出す
  
  resources :users
  resources :recipes 
end
