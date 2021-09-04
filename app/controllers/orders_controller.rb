class OrdersController < ApplicationController
	before_action :authenticate_user
	before_action :get_deal
	
	def new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def index
		@orders = @user.orders.where.not(status: 'Open')
	end

	def submit
		order = @user.orders.find_by(status: 'Open')
		order = @user.orders.create(status: 'Open') if order.nil?
		details = order.order_details.build(deal: @deal)
		deal_avbl = details.validate
		if deal_avbl[:status] && details.update_total
			redirect_to orders_path
		else
			respond_to do |format|
				format.js
			end
		end
	end

	private

	def authenticate_user
		user_id = cookies["login"]
		@user = User.find_by(id: user_id) if user_id
		redirect_to root_path if @user.nil?
	end	

	def get_deal
		@deal = Deal.find_by(active: true)
	end
end
