class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(user_params[:follow_id])
		following = current_user.follow(@user)
		if following.save
			flash[:notice] = 'ユーザーをフォローしました'
			redirect_to @user
		else
			flash.now[:alert] = 'ユーザーのフォローに失敗しました'
			redirect_to @user
		end
	end

	def destroy
		@user = User.find(user_params[:follow_id])
		following = current_user.follow(@user)
		if following.destroy
			flash[:notice] = 'ユーザーのフォローを解除しました'
			redirect_to @user
		else
			flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
			redirect_to @user
		end
	end

	private
	def user_params
		params.require(:relationship).permit(:follow_id)
	end
end
