Rails.application.routes.draw do
  scope :api do
    resources :guestbook, only: [:index, :create], controller: 'guestbook_entries'
    get 'visitor_count', to: 'visitor_counts#show'
    post 'visitor_count/increment', to: 'visitor_counts#increment'
    resources :books, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :contacts, only: [:create]
    namespace :admin do
      resources :books, only: [:update]
      resources :posts, only: [:index, :create]
    end
  end
end