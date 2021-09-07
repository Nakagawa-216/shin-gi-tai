class PostsController < ApplicationController
	def new
		@post = Post.new
	end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.category_id = params[:post][:select_category]
  	# binding.pry
  	@post.save
  	redirect_to root_path
  end

	def index
		@posts = Post.all
		@user = current_user
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:image, :body)
	end
end