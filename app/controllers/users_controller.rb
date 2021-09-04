class UsersController < ApplicationController
	before_action :set_user

	def show
		@user
	end

	private
		def set_user
			@user = User.find_by(id: params[:id])
			set_cookie if @user
		end

		def set_cookie
			cookies[:login] = { value: @user.id, expires: 1.hour }
		end
end