Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs do
    resources :comments
  end

  # scope shallow_path: "admin" do
  #   resources :blogs do
  #     resources :comments, shallow: true
  #   end
  # end
  # /admin/admin_id/blogs/blogs_id/comments/comments_id
  # /blogs/comments

  resources :users, only: [:create, :show, :make_admin] do
    collection do
      post '/login', to: 'users#login'
      patch '/admin', to: 'users#update'
    end
  end
end

# map.resources :sessions, :blogs
# map.home '', :controller => 'blogs', :action => 'index'
# map.login 'login', :controller => 'sessions', :action => 'new'
# map.logout 'logout', :controller => 'sessions', :action => 'destroy'
# http://railscasts.com/episodes/21-super-simple-authentication?autoplay=true

# Prefix Verb   URI Pattern                        Controller#Action
# blog_comments GET    /blogs/:blog_id/comments(.:format)     comments#index
#               POST   /blogs/:blog_id/comments(.:format)     comments#create
#  blog_comment GET    /blogs/:blog_id/comments/:id(.:format) comments#show
#               PATCH  /blogs/:blog_id/comments/:id(.:format) comments#update
#               PUT    /blogs/:blog_id/comments/:id(.:format) comments#update
#               DELETE /blogs/:blog_id/comments/:id(.:format) comments#destroy
#         blogs GET    /blogs(.:format)                       blogs#index
#               POST   /blogs(.:format)                       blogs#create
#          blog GET    /blogs/:id(.:format)                   blogs#show
#               PATCH  /blogs/:id(.:format)                   blogs#update
#               PUT    /blogs/:id(.:format)                   blogs#update
#               DELETE /blogs/:id(.:format)                   blogs#destroy
#   login_users POST   /users/login(.:format)                 users#login
#   admin_users PATCH  /users/admin(.:format)                 users#update
#         users POST   /users(.:format)                       users#create
#          user GET    /users/:id(.:format)                   users#show                  users#show
