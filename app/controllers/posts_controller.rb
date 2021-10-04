class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def new
		@post = Post.new
	end

  def create
		#ポスト作成機能
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.category_id = params[:post][:select_category]
		if @post.save
			flash[:notice] = "投稿が完了しました"
			#アクティビティポイント作成機能
			activity_point = ActivityPoint.new
			activity_point.category_id = @post.category_id
			activity_point.user_id = current_user.id
			activity_point.activity_point += 10
			activity_point.post_id = @post.id
			activity_point.save
			redirect_to post_path(@post)
		else
			flash.now[:alert] = "必要事項を入力してください"
			render("posts/new")
		end
  end

	def index
		@posts = Post.page(params[:page])
		@user = current_user
		#フォローしているユーザのポストを取得
		@following_users = current_user.followings
		@following_posts = Post.where(user_id: @following_users)
		#アクティビティポイントの計算
		@activity_points = (current_user.activity_points).sum(:activity_point)
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
		if post.update(post_params)
			flash[:notice] = "投稿内容を変更しました"
			redirect_to post_path(post)
		else
			flash.now[:alert] = "必要事項を入力してください"
			@post = Post.find(params[:id])
			render("posts/edit")
		end
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
	def correct_user
		@user = User.find(params[:id])
		redirect_to(posts_path) unless @user == current_user
	end
end
