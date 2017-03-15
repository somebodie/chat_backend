Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :blogs do
  #   resources :comments, only: [:index, :new, :create]
  # end
  #
  # resources :comments, only: [:show, :edit, :update, :destroy]

  scope shallow_path: "admin" do
    resources :articles do
      resources :comments, shallow: true
    end
  end

  resources :users, only: [:create, :show, :destroy] do
    collection do
      post '/login', to: 'users#login'
    end

  end

end

# map.resources :sessions, :blogs
# map.home '', :controller => 'blogs', :action => 'index'
# map.login 'login', :controller => 'sessions', :action => 'new'
# map.logout 'logout', :controller => 'sessions', :action => 'destroy'
# http://railscasts.com/episodes/21-super-simple-authentication?autoplay=true
