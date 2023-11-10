Rails.application.routes.draw do
  resources :finances
  resources :officer_entries
  resources :attendances
  resources :events
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  match 'about', to: "main#about", via: :get
  match 'hello', to: "main#hello", via: :get

  get 'main/index'

  resources :members do
    member do
      get :delete
      get :edit_weekly_points
      patch :update_weekly_points
      get :edit_officer_points
      put :update_officer_points
      get :edit_phone_number
      patch :update_phone_number
    end

    collection do
      get :bulk_edit_points
      patch :bulk_update_points
      get :officer_index
      get :bulk_edit_officer_points
      put :bulk_update_officer_points
    end
  end
  
  #get 'tasks/index'
  #get 'tasks/new'
  #get 'tasks/edit'
  #get 'tasks/show'
  #get 'tasks/delete'
  #get 'categories/index'
  #get 'categories/show'
  #get 'categories/new'
  #get 'categories/edit'
  #get 'categories/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events do
    member do
      get 'attend'
      post 'register_attendance'
    end
  end

  get '/profile', to: 'profiles#show', as: :profile
end
