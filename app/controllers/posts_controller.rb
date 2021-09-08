class PostsController < ApplicationController
	def new
		@post = Post.new
	end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.category_id = params[:post][:select_category]
  	@post.save
  	redirect_to root_path
  end

	def index
		@posts = Post.all
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:image, :body, :category_id)
	end
end
