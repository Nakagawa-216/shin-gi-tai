class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.all
		@relationship = Relationship.new
	end

	def following
		@user = User.find(params[:id])
		@users = @user.followings
	end

	def followers
		@user = User.find(params[:id])
		@users = @user.followers
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		# binding.pry
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :email, :icon_image)
	end
end
