Rails.application.routes.draw do
  get 'submissions/create'
  get 'submissions/show'  

  devise_for :users

  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :quizzes do 
    resources :questions
    resources :submissions, only: [:show, :create], as: 'submissions'
  end 

  get 'home/index'
  get 'home/dashboard'
  get 'home/course1'
  get 'home/course2'
  get 'home/course3'
 
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
