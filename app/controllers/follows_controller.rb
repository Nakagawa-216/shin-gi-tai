class FollowsController < ApplicationController
	def create
		# binding.pry
		@user = User.find(user_params[:user_id])
		@follow = Follow.new
		@follow.from_user_id = current_user.id
		@follow.to_user_id = @user.id
		binding.pry
		@follow.save!
		redirect_to user_path(@user)
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:user_id)
	end
end
