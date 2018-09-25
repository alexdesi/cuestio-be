Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#main'

  # get '/:path', to: 'pages#main'

  resources :quizzes, only: [:index, :show], to: 'pages#main'


  # resources :quizzes

  namespace :api do
    resources :quizzes
  end
end
