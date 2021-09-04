namespace :deals do
  desc "TODO"
  task toggle_deal_active_status: :environment do
    now = DateTime.now
    time_at_ten = DateTime.new(now.year, now.month, now.day, 10, 00, 0)
    deal = Deal.where('publish_date >= ?', time_at_ten).first
    deal.update_column("active", true) if deal
    Deal.where.not(id: deal.id).update_all(active: false)
  end

end
