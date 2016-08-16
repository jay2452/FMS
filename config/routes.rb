Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'feed_form/index'
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
      root 'feed_form#index', as: :authenticated_user
    end
  end

  # root 'home_pages#index'

end
