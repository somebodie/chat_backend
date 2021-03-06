class BlogsController < ApplicationController
  before_action :admin, except: [:index, :show]
  # http_basic_authenticate_with :admin?, except: [:index, :show]
  # http://guides.rubyonrails.org/getting_started.html

  def index
    render json: Blog.all
  end

  def show
    render json: Blog.find(params[:id])
  end

  # def new
  #   blog = Blog.new(blog_params)
  # end

  def create
    blog = Blog.create(blog_params)

    if blog.save
      render json: blog, status: :created
    else
      render json: blog.errors, status: :unprocessable_entity
    end
  end

  def update
    blog = Blog.find(params[:blog_id])
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
      params.require(:blog).permit(:title, :body, :author, :media, :user_id)
    end
end
