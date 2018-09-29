Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#main'

  resources :quizzes, only: [:index, :show], to: 'quizzes#main'

  namespace :api do
    resources :quizzes
  end
end
