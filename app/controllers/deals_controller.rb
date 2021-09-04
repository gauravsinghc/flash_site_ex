class DealsController < ApplicationController
	before_action :authenticate_user
	before_action :authorize_user, only: [:new, :create, :edit, :update, :index ]
	before_action :find_deal

	def welcome
		@active_deal = Deal.find_by(active: true)
		@order = @user.orders.includes(:order_details).where(status: 'Confirmed', order_details: {deal: @active_deal}) if @user
	end

	def index
		@deals = Deal.all
	end

	def new
		@deal = Deal.new
	end

	def create
		@deal = Deal.new(deal_params)
		respond_to do |format|
			if @deal.save
				format.html { redirect_to deals_path, notice: 'Deal was Created' }
			else
				format.html { redirect_to new_deal_path, alert: @deal.errors.full_messages.first }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @deal.update(deal_params)
				format.html { redirect_to deals_path, notice: 'Deal was Created' }
			else
				format.html { redirect_to new_deal_path, alert: @deal.errors.full_messages.first }
			end
		end
	end

	private

	def authenticate_user
		user_id = cookies["login"]
		@user = User.find_by(id: user_id) if user_id
	end

	def authorize_user
		redirect_to root_path if @user.nil? || !@user.admin?
	end

	def find_deal
		@deal = Deal.find(params[:id]) if params[:id]
	end

	def deal_params
    params.require(:deal).permit(:id, :title, :description, :price, :discounted_price, :quantity, :publish_date, :image)
  end

end