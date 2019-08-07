Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
    resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'likes/toggle_like/:id' => 'likes#toggle_like', as: 'toggle_like'
    get 'homes/index'
    root 'homes#index'
    
end
