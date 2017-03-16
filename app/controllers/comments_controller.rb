class CommentsController < ApplicationController
    before_filter :admin, except: [:index, :show, :create]
    # http_basic_authenticate_with :admin?, only: :destroy

    def index
      render json: Comment.all
    end

    def show
      render json: Comment.find(params[:id])
    end

    def create
      blog = Blog.find(params[:blog_id])
      comment = blog.comments.new(comment_params)

      if comment.save
        render json: comment, status: :created
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end

    def update
      comment = Comment.find(params[:id])
      if comment.update(comment_params)
        render json: comment
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      blog = Blog.find(params[:blog_id])
      comment = blog.comment.find(params[:id]).destroy

      render json: {status: 204}
    end

    private

      def comment_params
        params.require(:comment).permit(:tag, :post, :user_id, :comment_id)
      end

end
