Rails.application.routes.draw do
  root "members#index"

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
end
