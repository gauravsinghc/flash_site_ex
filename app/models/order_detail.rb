class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :deal
  validate :deal_grabbed

  def validate
    deal_grabbed = OrderDetail.where(deal: self.deal).sum(:quantity)
    if self.deal.nil? || deal_grabbed >= self.deal.quantity
      return {message: "Deal Out Of Stock", status: false}
    else
      return {message: "Available", status: true}
    end  
  end

  def update_total
    price = self.deal.discounted_price.present? ? self.deal.discounted_price : self.deal.price
    quantity = 1
    total_price = quantity * price
    self.quantity = quantity
    self.price = price
    self.total_price = total_price
    if self.save
      self.order.update_total
      self.deal.check_deal_outstock
      return true
    else
      return false  
    end
  end

  def deal_grabbed
    order = self.order.deal_grabbed(self.deal)
    result = order.present?
    self.errors.add(:base, 'Already Ordered') if result
  end

end
