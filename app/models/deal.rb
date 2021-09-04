class Deal < ApplicationRecord
	has_many_attached :image
	validates :publish_date, uniqueness: true, presence: true
	validates :price, presence: true
	validates :quantity, presence: true
	validates :title, presence: true
	has_one_attached :image, :dependent => :destroy

	after_save :check_active

	def check_active
		if Time.now >= self.publish_date
			self.update_column("active", true)
		end
		Deal.where.not(id: self.id).update_all(active: false)	
	end

	def check_deal_outstock
		deal_grabbed = OrderDetail.where(deal: self).sum(:quantity)
		if deal_grabbed >= self.quantity
			self.update_column("active", false)
		end
	end
end
