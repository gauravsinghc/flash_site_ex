class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  

  def update_total
    self.sub_total = self.order_details.sum(:total_price)
    self.date_new = DateTime.now
    self.status = "Confirmed"
    discount = calculate_loyalty_discount
    self.discount = discount.nil? ? 0.0 : discount
    self.grand_total = self.sub_total - self.discount # tax and discount can be added
    self.save
  end

  def deal_grabbed(deal)
    user = self.user
    order = user.orders.includes(:order_details).where(order_details: {deal: deal})
  end

  def calculate_loyalty_discount
    user = self.user
    order_count = user.orders.where(status: "Confirmed").count
    if order_count.between?(1, 4)
      discount = self.sub_total * (order_count / 100.0)
    elsif order_count >=5
      discount = self.sub_total * (5 / 100.0)
    end
    discount  
  end
end
