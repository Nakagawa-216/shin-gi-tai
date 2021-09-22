class UsersController < ApplicationController
	before_action :authenticate_user!

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
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

	def unsubscribe
		@user = User.find(params[:id])
	end

	def withdraw
		user = User.find(current_user.id)
		user.update(is_deleted: "true")
		reset_session
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :email, :icon_image)
	end
end
