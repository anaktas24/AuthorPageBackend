Rails.application.routes.draw do
  scope :api do
    resources :guestbook, only: [:index, :create], controller: 'guestbook_entries'
    get 'visitor_count', to: 'visitor_counts#show'
    post 'visitor_count/increment', to: 'visitor_counts#increment'
    resources :books, only: [:index, :show]
    resources :posts, only: [:index, :show, :create]
    resources :contacts, only: [:create]
  end

  # Serve React app for non-API routes
  get '*path', to: 'application#fallback', constraints: ->(req) { !req.xhr? && req.format.html? }
end