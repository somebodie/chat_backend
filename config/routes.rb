Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :comments
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
