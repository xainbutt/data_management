Rails.application.routes.draw do
  root to: 'user_files#index'

  resources :user_files do
    resources :notes
    resources :receipts
    resources :files, only: [:destroy]
  end

end
