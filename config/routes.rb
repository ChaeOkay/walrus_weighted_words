Rails.application.routes.draw do
  resources :word_searches, only: [:new, :create]
end
