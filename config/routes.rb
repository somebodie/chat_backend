Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :blogs do
  #   resources :comments, only: [:index, :new, :create]
  # end
  #
  # resources :comments, only: [:show, :edit, :update, :destroy]

  scope shallow_path: "admin" do
    resources :blogs do
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

#        Prefix Verb   URI Pattern                        Controller#Action
# blog_comments GET    /blogs/:blog_id/comments(.:format) comments#index
#               POST   /blogs/:blog_id/comments(.:format) comments#create
#       comment GET    /admin/comments/:id(.:format)      comments#show
#               PATCH  /admin/comments/:id(.:format)      comments#update
#               PUT    /admin/comments/:id(.:format)      comments#update
#               DELETE /admin/comments/:id(.:format)      comments#destroy
#         blogs GET    /blogs(.:format)                   blogs#index
#               POST   /blogs(.:format)                   blogs#create
#          blog GET    /blogs/:id(.:format)               blogs#show
#               PATCH  /blogs/:id(.:format)               blogs#update
#               PUT    /blogs/:id(.:format)               blogs#update
#               DELETE /blogs/:id(.:format)               blogs#destroy
#   login_users POST   /users/login(.:format)             users#login
#         users POST   /users(.:format)                   users#create
#          user GET    /users/:id(.:format)               users#show
#               DELETE /users/:id(.:format)               users#destroy
