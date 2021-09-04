class User < ApplicationRecord
	has_many :orders
	enum role: [:admin, :customer]

	def admin?
		self.role == "admin"
	end
end
