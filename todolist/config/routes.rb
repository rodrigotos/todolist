Rails.application.routes.draw do

  get 'notebooks/index'

  get 'notebooks/new'

  get 'notebooks/update'

  get 'notebooks/delete'



  devise_for :users, controllers: {
          sessions: 'users/sessions',
          passwords: 'users/passwords',
          registrations: 'users/registrations'
  }

  get 'tasks/index'

  get 'tasks/new'

  get 'tasks/update'

  get 'tasks/delete'

  resources :notebooks

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
