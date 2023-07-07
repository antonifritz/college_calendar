Rails.application.routes.draw do
  resources :college_classes
  resources :rooms
  resources :courses
  resources :course_types
  resources :lecturers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lecturers#index"
end

