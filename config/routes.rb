Rails.application.routes.draw do
  root to: 'word_searches#new'
  resources :word_searches, only: [:new, :create, :show, :index]
end
