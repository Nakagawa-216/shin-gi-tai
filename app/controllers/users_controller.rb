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
	end
end
