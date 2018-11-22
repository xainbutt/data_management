Rails.application.routes.draw do
  root to: 'user_files#index'

  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end
  resources :user_files do
    resources :notes
    resources :receipts
    resources :files, only: [:destroy]
  end

end
