Rails.application.routes.draw do

  resources :foods do
    collection { post :import }
  end
  
  resources :foods
  resources :nutri_attributes
  resources :enviro_types
  resources :nutri_values
  resources :enviro_values

  get 'home', to: 'home#index', as: :home
  get 'about' => 'home#about', :as => :about
  get 'news' => 'home#news', :as => :news
  get 'calc' => 'home#calc', :as => :calc

  get 'demographics' => 'home#demographics', as: :demographics

  get 'search_results', to: 'foods#search_results', as: :search_results
  get 'search', to: 'foods#search', as: :search
  get 'add', to: 'foods#search_add', as: :search_add
  get 'deselect/:id', to: 'foods#deselect_food', as: :deselect_food
  get 'food/import' => 'foods#import'

  root 'home#index'

end
