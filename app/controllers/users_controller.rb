class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.page(params[:page])
		@relationship = Relationship.new
		#アクティビティポイントの処理
		@activity_points = ActivityPoint.where(user_id: params[:id])
		@weekly_points = @activity_points.where(created_at: 1.week.ago...Time.zone.now)
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
		if user.update(user_params)
			flash[:notice] = "登録情報を変更しました"
			redirect_to user_path(user)
		else
			flash.now[:alert] = "必要事項を入力してください"
			@user = User.find(params[:id])
			render("users/edit")
		end
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

	def correct_user
		@user = User.find(params[:id])
		redirect_to(user_path(current_user)) unless @user == current_user
	end
end
