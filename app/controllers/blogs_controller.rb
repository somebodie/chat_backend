class BlogsController < ApplicationController
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