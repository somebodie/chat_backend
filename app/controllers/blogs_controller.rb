class BlogsController < ApplicationController
  blog_controller- before_filter :authorize_admin, :expect => :index or [:index; :show]
  # The code below can be used to grant admin status to the current user.
  # current_user.update_attribute :admin, true
  # https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role

  def index
    render json: Blog.all
  end

  def show
    render json: Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)

    if blog.save
      render json: blog, status: :created, location: blog
    else
      render json: blog.errors, status: :unprocessable_entity
    end
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      render json: blog
    else
      render json: blog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Blog.find(params[:id]).destroy

    render json: {status: 204}
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :body, :author, :media, :created_at, :updated_at)
    end
end
