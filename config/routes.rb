Rails.application.routes.draw do
  get 'max_view(/:date)(.:format)' => 'skill#max'
  get 'musics(/:date)(.:format)' => 'music#index'
  resources :list, only: [:index]
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
