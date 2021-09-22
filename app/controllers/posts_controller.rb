class PostsController < ApplicationController
	def new
		@post = Post.new
	end

  def create
  	#ポスト作成機能
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.category_id = params[:post][:select_category]
  	@post.save
  	#アクティビティポイント作成機能

  	activity_point = ActivityPoint.new
  	activity_point.category_id = @post.category_id
  	activity_point.user_id = current_user.id
  	activity_point.activity_point += 10
  	activity_point.post_id = @post.id
  	activity_point.save
  	redirect_to post_path(@post)
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
