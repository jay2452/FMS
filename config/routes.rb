Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/users_list'

  post 'admin/subject_import'
  post 'admin/user_import'


  resources :student_subjects
  resources :sections
  resources :semesters
  resources :programs
  resources :faculty_subjects
  resources :faculties
  resources :subjects
  mount Ckeditor::Engine => '/ckeditor'
  get 'feed_form/index'
  get 'feed_form/instruction'
  get 'feed_form/thankyou'

  post 'feed_form/index'

  resources :criteria
  resources :feedbacks
  resources :courses
  get 'home_pages/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: :login
    delete '/logout' => 'devise/sessions#destroy', as: :logout
    unauthenticated do
      root 'devise/sessions#new'
    end

    authenticated do
      root 'feed_form#instruction', as: :authenticated_user
    end
  end

  # root 'home_pages#index'


end
